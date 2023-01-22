# Migration

Database migrations allows you keeps consistent state of your database schema.

The most useful use cases for database migrations are when deploying services to other environments
## Schema
Init schema migration file `app/io/db/migrations/schema/m_000000000_init.go` contain method `Up(tx *godb.SqlTx) error` <br> 
for database schema initialisation. Write custom code here to define tables schema witch must be applied on project deploy 

For example, you can create `dictionary` table
```go
package schema

import "github.com/dimonrus/gomodel"
...
    gomodel.CreateDictionaryTable(tx)
```
## Data
Init data migration file `app/io/db/migrations/data/m_000000000_init.go` allows you input data into existing database tables

Data migrations must be applied after schema migration run

Similar to migration schema put custom code into `Up(tx *godb.SqlTx) error` method. 

For example, we can add several values into dictionary table:

```go
package data

import (
	"github.com/dimonrus/gomodel"
	"github.com/dimonrus/gohelp"
)
...
    collection := gomodel.NewCollection[gomodel.DictionaryModel]()
    collection.AddItem(
        &gomodel.DictionaryModel{
            Id:    gohelp.Ptr[int32](1000),
            Type:  gohelp.Ptr("test_category"),
            Code:  gohelp.Ptr("white"),
            Label: gohelp.Ptr("White"),
        },
        &gomodel.DictionaryModel{
            Id:    gohelp.Ptr[int32](1010),
            Type:  gohelp.Ptr("test_category"),
            Code:  gohelp.Ptr("blue"),
            Label: gohelp.Ptr("Blue"),
        },
        &gomodel.DictionaryModel{
            Id:    gohelp.Ptr[int32](1020),
            Type:  gohelp.Ptr("test_category"),
            Code:  gohelp.Ptr("red"),
            Label: gohelp.Ptr("Red"),
        })
    return collection.Save(tx)
```
## Run migration
To run schema migration input command with `-class=schema` argument into your terminal.
```bash
./tutorial -app=script -name=migration -class=schema
```

To run data migration input command with `-class=data` argument into your terminal.
```bash
./tutorial -app=script -name=migration -class=data
```
## Create new migration
To create new migration file enter following command:
```bash
./tutorial -app=script -name=migration -class=schema -file=new_migration
```
It will create schema migration file `app/io/db/migrations/schema/m_1674416514_new_migration.go`

Same way you can create data migration file:
```bash
./tutorial -app=script -name=migration -class=data -file=new_migration
```
File will be created in data migration folder

** migration file format contain timestamp in filename. That allows to apply migrations in historical order

[STATE OF CODE #4](https://github.com/dimonrus/tutorial/commit/df68d57870096816e4b883ba5e62a5ea1b17ce7f)