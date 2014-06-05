//
//  nodelib_osxTests.mm
//  nodelib-osxTests
//
//  Created by Isaac Burns on 4/16/14.
//  Copyright (c) 2014 Flyover Games. All rights reserved.
//

#import <XCTest/XCTest.h>

#include "node.h"

@interface nodelib_osxTests : XCTestCase

@end

@implementation nodelib_osxTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);

	const char* node_argv[] = 
	{
		"node", "-e",
		"console.log('Hello, Node ' + process.version + '!');"
	};
    const int node_argc = sizeof(node_argv) / sizeof(*node_argv);
    int node_err = node::Start(node_argc, (char**) node_argv);
    if (node_err)
    {
        XCTFail(@"node_err: %d", node_err);
    }
}

@end
