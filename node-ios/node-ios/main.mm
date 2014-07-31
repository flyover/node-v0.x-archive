//
//  main.mm
//  node-ios
//
//  Created by Isaac Burns on 4/16/14.
//  Copyright (c) 2014 Flyover Games. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#include "node.h"

int main(int argc, char * argv[])
{
	const char* node_argv[] = 
	{
		"node", "-e",
		"console.log('Hello, Node ' + process.version + '!');"
	};
    const int node_argc = sizeof(node_argv) / sizeof(*node_argv);
    int node_err = node::Start(node_argc, (char**) node_argv);
    if (node_err)
    {
        printf("node_err: %d\n", node_err);
        return node_err;
    }
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
