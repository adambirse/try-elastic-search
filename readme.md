# Try Elastic Search

## Getting Started

`docker-compose up`

Create an index called products:

```bash
curl -X PUT http://localhost:9200/products
```
or 
`./create_product_index.sh`

Bulk insert:

``` bash
curl -s -H "Content-Type: application/json" -X POST \
'http://localhost:9200/_bulk?pretty' --data-binary @products.json
```
or
`./product_data_load.sh`



Query for products:
```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json' -d' { "query": { "match": { "title": "shoes" } } }'
```

More complicated query:

```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": { 
    "bool": { 
      "must": [
        { "match": { "title":   "shoes"    }},
        { "match": { "person": "Adam" }}
      ]
    }
  }
}
'
```

Filter example:

```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": { 
    "bool": { 
      "must": [
        { "match": { "title":   "shoes"    }},
        { "match": { "person": "Adam" }}
      ],
       "filter": [ 
        { "term":  { "status": "avaliable" }}
      ]
    }
  }
}
'
```

Sort example (not working yet as index doesnt support sorting - need to reindex):

```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": { 
    "bool": { 
      "must": [
        { "match": { "title":   "shoes"    }},
        { "match": { "person": "Adam" }}
      ],
       "filter": [ 
        { "term":  { "status": "avaliable" }}
      ]
    }
  },
    "sort" : [
        { "status" : {"order" : "asc"}}
    ]
}
'
```

Get all products:
```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json'
```


## Reference Material

[A beginners guide to elastic search](https://geshan.com.np/blog/2023/06/elasticsearch-docker/)

[Bulk upload](https://typesense.org/learn/elasticsearch-bulk-import-json/)

https://makit.net/blog/building-with-aws-opensearch-serverless/