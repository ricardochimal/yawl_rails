# Yawl Rails

This is the UI and Rails integration component of [yawl](https://github.com/ricardochimal/yawl)

## Migrations

`yawl_rails` automatically sets the schema file to be in sql format because of the `json` column used in `yawl`

```
config.active_record.schema_format = :sql
```
