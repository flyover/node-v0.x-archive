//
//  main.mm
//  nodelike-osx
//
//  Created by Isaac Burns on 4/16/14.
//  Copyright (c) 2014 Flyover Games. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include "node.h"

int main(int argc, const char * argv[])
{
	const char* node_argv[] = 
	{
		"node", "-e",
		"console.log('Hello, Node ' + process.version + '!');"

		"var a = new Uint32Array(1);"
		"a[0] = 0xff;"
		"console.log(a[0], a[0].toString(16));"
		"a[0] = ((a[0] << 24) & 0xff000000);"
		"console.log(a[0], a[0].toString(16));"

		"var a = 0xff;"
		"console.log(a, a.toString(16));"
		"a = ((a << 24) & 0xff000000);"
		"console.log(a, a.toString(16));"
	};
    const int node_argc = sizeof(node_argv) / sizeof(*node_argv);
    int node_err = node::Start(node_argc, (char**) node_argv);
    if (node_err)
    {
        printf("node_err: %d\n", node_err);
        return node_err;
    }
    
    return NSApplicationMain(argc, argv);
}
