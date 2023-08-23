use actix_web::middleware::Logger;
use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use std::fs::OpenOptions;

#[derive(Serialize)]
pub struct GenericResponse {
    pub status: String,
    pub message: String,
}

#[derive(Deserialize)]
pub struct LogInfo {
    level: String,
    message: String,
    error: Option<String>,
    stackTrace: Option<String>,
}

fn format_log_entry(info: &LogInfo, time: DateTime<Utc>) -> String {
    let error = match &info.error {
        Some(error) if !error.is_empty() => format!("[{}] -", error),
        _ => String::new(),
    };

    let stack_trace = match &info.stackTrace {
        Some(stack_trace) if !stack_trace.is_empty() => format!("[{}] -", stack_trace),
        _ => String::new(),
    };

    format!(
        "[{}] [{}] - {} {} {}",
        time.to_rfc3339(),
        info.level,
        info.message,
        error,
        stack_trace
    )
}

#[post("/logs")]
async fn logs_handler(info: web::Json<LogInfo>) -> impl Responder {
    let now = Utc::now();
    let log_entry = format_log_entry(&info, now);

    // Save the log to a .log file
    if let Err(err) = save_log(&log_entry) {
        eprintln!("Error saving log: {}", err);
        return HttpResponse::InternalServerError().json(GenericResponse {
            status: "error".to_string(),
            message: "Failed to save log".to_string(),
        });
    }

    HttpResponse::Ok().json(GenericResponse {
        status: "success".to_string(),
        message: "Log saved successfully".to_string(),
    })
}

use std::io::Write;

fn save_log(log_entry: &str) -> Result<(), Box<dyn std::error::Error>> {
    let file = OpenOptions::new()
        .append(true)
        .create(true)
        .open("cognivoice.log")?;

    let mut file = std::io::LineWriter::new(file);

    // Replace line breaks and carriage returns with a space
    let log_entry = log_entry.replace('\n', " ").replace('\r', " ");

    file.write_all(log_entry.as_bytes())?;
    file.write_all(b"\n")?;

    Ok(())
}

#[get("/health")]
async fn health_handler() -> impl Responder {
    HttpResponse::Ok().json(GenericResponse {
        status: "success".to_string(),
        message: "Server is running".to_string(),
    })
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    if std::env::var_os("RUST_LOG").is_none() {
        std::env::set_var("RUST_LOG", "actix_web=info");
    }
    env_logger::init();

    println!("🚀 Server started successfully on http://127.0.0.1:3002");

    HttpServer::new(move || {
        App::new()
            .service(logs_handler)
            .service(health_handler)
            .wrap(Logger::default())
    })
    .bind(("127.0.0.1", 3002))?
    .run()
    .await
}
