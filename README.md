# New Service Template

A template for creating new templates

#### Table of contents

* [Introduction](#introduction)
    * [Project structure](#project-structure)
* [Development](#development)
    * [1. Prerequisites](#1-prerequisites)
    * [2. Setup](#2-setup)
    * [3. Running locally](#3-running-locally)
* [Testing](#testing)
    * [1. Running tests](#1-running-tests)

## Introduction

### Project structure

Below is a quick outline of the structure of the app:

```text
.
├── api                        # API endpoints
|   ├── some-endpoint
|   |   |   ├── controller.ts  # Calls the service methods and handles responses
|   |   |   ├── router.ts      # Sets up the router and all the available routes
|   |   |   └── service.ts     # Handles the more granular parts; DB actions, remote requests etc.
|   │   └── ...
├── constants                  # Constants to use throughout the service
│   └── ...
├── errors                     # Error classes and helpers
│   └── ...
├── middlewares                # Custom Express middlewares
│   └── ...
├── models                     # ORM-odels
│   └── ...
├── modules                    # Modules are used to separate code to make it more testable
|   ├── some-module
|   |   ├── doesSomethingCool.ts
|   |   ├── index.ts
|   │   └── ...
│   └── ...
├── types                      # TypeScript types & interfaces
│   └── ...
├── utils                      # Utility functions
│   └── ...
├── index.ts                   # Entrypoint - starts the server
└── server.ts                  # This is where the Express app is setup and configured
```

## Development

### 1. Prerequisites

* Install [Yarn](https://yarnpkg.com/).
* Install [Docker](https://docs.docker.com/get-docker/).
* Install [Docker Compose](https://docs.docker.com/compose/install/).

### 2. Setup

1. Clone the [workspace2](https://github.com/ask-products/workspace2) repository.

2. See [here](https://github.com/ask-products/workspace#set-up) for instructions on how to get the local askporter platform set-up.

### 3. Running locally

1. From the *workspace2* directory, run:
```bash
docker-compose up applications_service
```

2. You can check the API is running using the following cURL command:
```shell script
curl -X GET http://localhost:3178/healthcheck
```

## Testing

### 1. Running tests

1. Simply run the command:
```bash
yarn test
```
This will build and run a Postgres docker image and run the tests against it.
