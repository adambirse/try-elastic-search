# Try Elastic Search

## Getting Started

`docker-compose up`

Create an index called products:

```bash
curl -X PUT http://localhost:9200/products
```

Add a product:

```bash
curl -X POST -H 'Content-Type: application/json' -d '{ "name": "Awesome T-Shirt", "description": "This is an awesome t-shirt for casual wear.", "price": 19.99, "category": "Clothing", "brand": "Example Brand" }' http://localhost:9200/products/_doc
```

Query for products:
```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json' -d' { "query": { "match": { "name": "t-shirt" } } }'
```
Get all products:
```bash
curl -X GET "localhost:9200/products/_search?pretty" -H 'Content-Type: application/json'
```

Bulk insert:

``` bash
curl -s -H "Content-Type: application/json" -X POST \
'http://localhost:9200/_bulk?pretty' --data-binary @products.json
```

## Reference Material

[A beginners guide to elastic search](https://geshan.com.np/blog/2023/06/elasticsearch-docker/)
[Bulk upload](https://typesense.org/learn/elasticsearch-bulk-import-json/)