A (experimental) trino support for dbt-re-data

Check [here](https://github.com/re-data/dbt-re-data) for more details about dbt-re-data

### Usage
Add those to current dbt project

```packages.yml
packages:
  ...
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
```

install dbt packages by running
```
dbt deps
```

then use re-data as usuall. Check [this](https://docs.getre.io/latest/docs/getting_started/installation/for_dbt_users) for more details.

