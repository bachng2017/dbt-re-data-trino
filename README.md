A (experimental) trino support for dbt-re-data

Check [here](https://github.com/re-data/dbt-re-data) for more details about dbt-re-data

### Usage
Install necessary packages `dbt_utils`, `trino_utils`,`re-data` and this package `dbt-re-data-trino`

```packages.yml
packages:
  ...
  - package: "dbt-labs/dbt_utils"
    version: "0.8.6"
  - package: starburstdata/trino_utils
    version: 0.1.1
  - git: "https://github.com/re-data/dbt-re-data.git"
  - git: "https://github.com/bachng2017/dbt-re-data-trino.git"
```

configure the dispatch order in the project file `dbt_project.yml`
```dbt_project.yml
dispatch:
  ...
  - macro_namespace: re_data
    search_order:
      - re_data_trino
      - re_data
  - macro_namespace: dbt_utils
    search_order:
      - re_data_trino
      - trino_utils
      - dbt_utils
  - macro_namespace: fivetran_utils
    search_order:
      - re_data_trino
      - fivetran_utils
```

Notes: 
  - `dbt_utils`,`trino_utils` packages are necessary. `fivetran_utils` will be installed automatically by dbt-re-data
  - until `current_timestamp_in_utc` is implemented by dbt Core, a temporary macro is provided by this package. Hence, `re_data_trino` need to be prior to `dbt_utils` in it's namespace
  - untin `urrent_timestamp_backcompat` is implement by dbt-trino-util, `re_data_trino` need to be prior `dbt` it it's namespace (for dbt_utils > 1.0.0)



install dbt packages by running
```
dbt deps
```

then use re-data as usuall. Check [this](https://docs.getre.io/latest/docs/getting_started/installation/for_dbt_users) for more details.

