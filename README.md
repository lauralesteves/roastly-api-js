# ☕ Roastly API - Serverless Product Management

A production-ready, fully tested **CRUD API** for managing coffee shop products — built with **Node.js**, **TypeScript**, **AWS Lambda**, and **DynamoDB**.

Supports deployment via both:
- [Serverless Framework](https://www.serverless.com/)
- [AWS SAM (Serverless Application Model)](https://docs.aws.amazon.com/serverless-application-model/)

---

## 📦 Features

- RESTful API with full CRUD: `POST`, `GET`, `PUT`, `DELETE`
- DynamoDB-backed persistence
- Multi-environment (dev, local, prod) support
- Serverless-friendly architecture
- Esbuild packaging
- CI-ready with GitHub Actions (or Serverless Pro/CodePipeline)
- Tested with Jest and AWS Lambda mocks
- Plug-and-play support for AWS SAM deployments

---

## 📁 Project Structure

src/
├── config/ # DynamoDB client (local + cloud)
├── controllers/ # Lambda handlers
├── services/ # Business logic
├── repositories/ # DynamoDB access
├── models/ # Product schema + Joi validation
serverless.yml # Serverless config
template.yaml # SAM deployment config

---

## 🧪 Local Development

### 🔁 With Serverless Framework (Recommended)

> Make sure you have `serverless`, `docker`, and `aws-cli` installed.

1. Start DynamoDB Local:

```bash
docker-compose up -d
npm run seed:local
npx serverless offline --stage local
```

Your API is now live at http://localhost:3000/local/products

### 🔁 With AWS SAM

1. Build the SAM project:

```bash
sam build
```

Start the local API:

```bash
sam local start-api
```

Your API is now running at http://127.0.0.1:3000

## 🚀 Deployment
### 🔧 Serverless Framework
Configure AWS credentials, then:

```bash
npx serverless deploy --stage dev
```

Your endpoint will look like:
`https://<rest-id>.execute-api.us-east-1.amazonaws.com/dev/products`

### 🔧 AWS SAM
Deploy using guided setup:

```bash
sam deploy --guided
```

Or in CI:
```bash
sam deploy --stack-name roastly-api \
  --template-file template.yaml \
  --capabilities CAPABILITY_IAM \
  --region us-east-1
```

## 🔍 API Reference

| Method | Path             | Description       |
| ------ | ---------------- | ----------------- |
| POST   | `/products`      | Create a product  |
| GET    | `/products`      | List all products |
| GET    | `/products/{id}` | Get product by ID |
| PUT    | `/products/{id}` | Update product    |
| DELETE | `/products/{id}` | Delete product    |

🧪 Testing

```bash
npm run test
```

Uses jest with:

- Fully mocked repositories and services
- API handler unit tests
- Integration-ready structure

👩‍💻 Author
Made with ☕ by [@lauralesteves](https://github.com/lauralesteves)


