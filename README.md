A (experimental) trino support for dbt-re-data

Check [here](https://github.com/re-data/dbt-re-data) for more details about dbt-re-data

### Usage
Add those to current dbt project

```packages.yml
packages:
  ...
  - package: "dbt-labs/dbt_utils"
    version: "0.8.6"
  - git: "https://github.com/re-data/dbt-re-data.git"
  - git: "https://github.com/bachng2017/dbt-re-data-trino.git"
```

and this
```dbt_project.yml
dispatch:
  ...
  - macro_namespace: re_data
    search_order:
      - re_data_trino
      - re_data
  - macro_namespace: dbt_utils
    search_order:
      - trino_utils
      - dbt_utils
  - macro_namespace: fivetran_utils
    search_order:
      - re_data_trino
      - fivetran_utils
```

Notes: `dbt_utils` package is necessary. `fivetran_utils` will be installed automatically by dbt-re-data

install dbt packages by running
```
dbt deps
```

then use re-data as usuall. Check [this](https://docs.getre.io/latest/docs/getting_started/installation/for_dbt_users) for more details.

