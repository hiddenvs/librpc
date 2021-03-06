/*
 * Copyright 2015-2017 Two Pore Guys, Inc.
 * All rights reserved
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted providing that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include <errno.h>
#include <rpc/object.h>
#include <rpc/client.h>
#include <rpc/connection.h>
#include <rpc/rpcd.h>
#include "internal.h"

rpc_client_t
rpcd_connect_to(const char *service_name)
{
	rpc_client_t client;
	rpc_connection_t conn;
	rpc_auto_object_t result = NULL;
	char *path;

	client = rpc_client_create(RPCD_SOCKET_LOCATION, NULL);
	if (client == NULL)
		return (NULL);

	conn = rpc_client_get_connection(client);
	path = g_strdup_printf("/%s", service_name);
	result = rpc_connection_call_syncp(conn, path, RPCD_SERVICE_INTERFACE,
	    "connect", "[]");

	if (result == NULL) {
		rpc_client_close(client);
		return (NULL);
	}

	if (rpc_is_error(result)) {
		rpc_client_close(client);
		rpc_set_last_rpc_error(result);
		return (NULL);
	}

	if (rpc_get_type(result) == RPC_TYPE_FD) {
		/* File descriptor was passed to us */
		rpc_client_close(client);
		return (rpc_client_create("socket://", result));
	}

	if (g_strcmp0(rpc_string_get_string_ptr(result), "BRIDGED") == 0) {
		/* Bi-dir bridging */
		return (client);
	}

	g_assert_not_reached();

}

int
rpcd_register(const char *uri, const char *name, const char *description)
{
	rpc_client_t client;
	rpc_connection_t conn;
	rpc_auto_object_t result = NULL;

	client = rpc_client_create(RPCD_SOCKET_LOCATION, NULL);
	if (client == NULL)
		return (-1);

	conn = rpc_client_get_connection(client);
	result = rpc_connection_call_syncp(conn, "/", RPCD_MANAGER_INTERFACE,
	    "register_service", "[{s,s,s}]",
	    "uri", uri,
	    "name", name,
	    "description", description);

	if (result == NULL) {
		rpc_client_close(client);
		return (-1);
	}

	if (rpc_is_error(result)) {
		rpc_client_close(client);
		rpc_set_last_rpc_error(result);
		return (-1);
	}

	return (0);
}
