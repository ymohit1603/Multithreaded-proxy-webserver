# Multi-Threaded Proxy Server with Cache

A multi-threaded proxy server written in `C`, designed to handle HTTP requests efficiently with a cache using the LRU algorithm. It allows multiple clients to connect concurrently, reducing server load and improving response times.

---

## Features
- **Multi-threading**: Handles multiple client requests simultaneously using semaphores for synchronization.
- **Cache**: Implements an LRU (Least Recently Used) cache to store and retrieve responses for frequently accessed URLs.
- **Concurrency Control**: Uses semaphores instead of condition variables for thread management.
- **Privacy & Security**: Can be extended to mask the client’s IP and encrypt requests for added security.

---

## Table of Contents
1. [Overview](#overview)
2. [Project Theory](#project-theory)
3. [How to Run](#how-to-run)
4. [Demo](#demo)

---

## Overview
This proxy server intercepts client requests and retrieves data from the internet on behalf of the client. It can cache responses for frequently visited websites to speed up future requests.
- **With Cache**: Stores responses in an LRU cache to speed up repeated requests.

---

## Project Theory

### 1. **Working Flow of the Proxy Server**
The server listens for incoming client requests, retrieves the data from the target server, and sends it back to the client. If the requested data is in the cache, it is returned directly; otherwise, the server fetches the data and stores it in the cache for future use.

### 2. **How Multi-Threading is Implemented**
- We use semaphores instead of condition variables for synchronization, which simplifies the code and avoids issues with `pthread_join()`.

### 3. **Why Use a Proxy Server?**
- **Speed**: Reduces the number of requests made to the server by caching frequently requested data.
- **Privacy**: Hides the client’s IP address, providing anonymity.
- **Access Control**: Restrict access to certain websites by modifying the proxy logic.

### 4. **OS Components Used**
- Threading and synchronization mechanisms (semapires, locks)
- Cache management using the LRU algorithm.

---

## How to Run

### Prerequisites
- Linux-based system (e.g., Ubuntu)
- `make` and `gcc` installed

### Steps:
1. Clone the repository:
    ```bash
    $ git clone https://github.com/ymohit1603/Multithreaded-proxy-webserver
    ```
2. Navigate to the project directory:
    ```bash
    $ cd Multithreaded-proxy-webserver
    ```
3. Compile the code:
    ```bash
    $ make all
    ```
4. Run the proxy server:
    ```bash
    $ ./proxy <port number>
    ```
5. Access a website through the proxy:
    - Example: Open your browser and visit `http://localhost:<port>/https://www.cs.princeton.edu/`

---

## Demo

- On the **first visit**, the cache will **miss** and the data will be fetched from the server.
- On **subsequent visits**, the data will be served **from the cache**, improving response time.



---

