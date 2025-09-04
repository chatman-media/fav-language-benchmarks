// main.go
package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
)

// Input структура для приходящего JSON
type Input struct {
	Number int `json:"number"`
}

// Output структура для ответа
type Output struct {
	Message string `json:"message"`
	Number  int    `json:"number"`
}

// Обработчик /json
func handleJSON(w http.ResponseWriter, r *http.Request) {
	// Только POST
	if r.Method != http.MethodPost {
		w.WriteHeader(http.StatusMethodNotAllowed)
		return
	}

	// Декодируем тело
	var input Input
	if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	// Формируем ответ
	output := Output{
		Message: "world",
		Number:  input.Number + 1,
	}

	// Устанавливаем заголовок и кодируем
	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(output); err != nil {
		// Нельзя отправить статус после записи, но можно проигнорировать
		return
	}
}

func main() {
	// Отключаем стандартные логи (или оставь только в dev)
	// Если хочешь — закомментируй, чтобы видеть ошибки
	log.SetOutput(os.Stdout) // можно заменить на os.Stderr или ioutil.Discard

	// Отключить логи можно так (в проде):
	// log.SetOutput(io.Discard)

	// Маршрутизация
	http.HandleFunc("/json", handleJSON)

	port := "3000"
	log.Printf("Server is listening on :%s...\n", port)

	// Запуск сервера без логирования каждого запроса
	// Это важно — стандартный логгер http.Server логирует каждый запрос
	// Мы его заменим на silent или кастомный
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatal("Server failed: ", err)
	}
}