/*
 * Copyright 2017 Two Pore Guys, Inc.
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

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <dispatch/dispatch.h>
#include <rpc/object.h>
#include <rpc/client.h>

int
main(int argc, const char *argv[])
{
	rpc_client_t client;
	rpc_connection_t conn;

	(void)argc;
	(void)argv;

	client = rpc_client_create("tcp://127.0.0.1:5000", 0);
	if (client == NULL) {
		fprintf(stderr, "cannot connect: %s", strerror(errno));
		return (1);
	}

	conn = rpc_client_get_connection(client);
	rpc_connection_set_dispatch_queue(conn,
	    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));

	dispatch_async(dispatch_get_main_queue(), ^{
		rpc_object_t args;
		args = rpc_object_pack("[s]", "world");
		rpc_connection_call(conn, NULL, NULL, "hello", args,
		    ^bool(rpc_call_t call) {
			printf("%s\n", rpc_copy_description(rpc_call_result(call)));
			rpc_client_close(client);
			exit(0);
		});
	});

	dispatch_main();
}
