import http from 'k6/http';
import { check } from 'k6';

export const options = {
  vus: 100,         // количество виртуальных пользователей
  duration: '30s',  // сколько гонять тест
};

export default function () {
  const url = 'http://localhost:3000/json';
  const payload = JSON.stringify({
    message: 'hello',
    number: 42,
  });

  const params = {
    headers: { 'Content-Type': 'application/json' },
  };

  const res = http.post(url, payload, params);

  check(res, {
    'status 200': (r) => r.status === 200,
    'json valid': (r) => r.json('number') === 43,
  });
}