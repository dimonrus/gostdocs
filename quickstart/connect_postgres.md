# Connect to Postgres

By default, database connection defined in Application object
## Access to database
```go
package core

import (
	"tutorial/app/base"
)
...
    db := base.App.GetDB()
    err := db.QueryRow(...)
```

## Database credentials
Database credential configuration defined in `app/config/yaml/local.yaml`
```yaml
db:
  host: 0.0.0.0
  port: 5432
  name: tutorial
  user: tutorial
  password: tutorial
```

`0.0.0.0` means that postgres accept connections on local machine. You can set up postgres via `compose.yaml`

```bash
docker-compose -f compose.yaml up postgres
```
[STATE OF CODE #2](https://github.com/dimonrus/tutorial/commit/4c1f471cd05d072323cdd857996c6fa9df875f2d)