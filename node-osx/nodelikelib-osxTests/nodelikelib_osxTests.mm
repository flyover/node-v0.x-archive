//
//  nodelikelib_osxTests.mm
//  nodelikelib-osxTests
//
//  Created by Isaac Burns on 4/16/14.
//  Copyright (c) 2014 Flyover Games. All rights reserved.
//

#import <XCTest/XCTest.h>

#include "node.h"

@interface nodelikelib_osxTests : XCTestCase

@end

@implementation nodelikelib_osxTests

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
        XCTFail(@"node_err: %d", node_err);
    }
}

@end
