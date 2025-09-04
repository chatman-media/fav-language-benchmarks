// src/main.rs

use axum::{
    extract::Json,
    http::StatusCode,
    response::IntoResponse,
    routing::post,
    Router,
};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;
use tokio::net::TcpListener;

#[derive(Deserialize)]
struct Input {
    number: i32,
}

#[derive(Serialize)]
struct Output {
    message: String,
    number: i32,
}

#[tokio::main(flavor = "multi_thread", worker_threads = 16)]
async fn main() {
    let app = Router::new().route("/json", post(handle_json));

    let addr = SocketAddr::from(([0, 0, 0, 0], 3000));
    println!("Server running on http://{}", addr);

    let listener = TcpListener::bind(&addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn handle_json(Json(input): Json<Input>) -> impl IntoResponse {
    let output = Output {
        message: "world".to_string(),
        number: input.number + 1,
    };
    (StatusCode::OK, Json(output))
}