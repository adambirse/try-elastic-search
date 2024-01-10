# AWS Opensearch

- follow this tutorial
https://docs.aws.amazon.com/opensearch-service/latest/developerguide/gsg.html


```bash
curl -XPOST -u 'master-user:master-user-password' 'domain-endpoint/_bulk' --data-binary @bulk_movies.json -H 'Content-Type: application/json'
```

```bash
curl -XGET -u 'master-user:master-user-password' 'domain-endpoint/movies/_search?q=rebel&pretty=true'

```