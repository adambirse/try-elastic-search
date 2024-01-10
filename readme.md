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

## Reference Material

[A beginners guide to elastic search](https://geshan.com.np/blog/2023/06/elasticsearch-docker/)