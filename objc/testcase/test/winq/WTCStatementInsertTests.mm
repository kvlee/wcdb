/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WTCAssert.h"
#import "WTCBaseTestCase.h"

using namespace WCDB;

@interface WTCStatementInsertTests : WTCBaseTestCase

@end

@implementation WTCStatementInsertTests

- (void)testStatementInsert
{
    //Give
    Column column1("column1");
    Column column2("column2");
    
    std::string table1 = "table1";
    
    //Then
    XCTAssertEqual(StatementInsert().getStatementType(), Statement::Type::Insert);
    
    WINQAssertEqual(StatementInsert().insert(table1).values({1, "value"}), @"INSERT INTO table1 VALUES(1, 'value')");
    
    WINQAssertEqual(StatementInsert().insert(table1, {column1, column2}).values({1, "value"}), @"INSERT INTO table1(column1, column2) VALUES(1, 'value')");
    
    WINQAssertEqual(StatementInsert().insert(table1, Conflict::Replace).values({1, "value"}), @"INSERT OR REPLACE INTO table1 VALUES(1, 'value')");
}

@end
