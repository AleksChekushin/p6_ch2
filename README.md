# Авторизация
1. AuthTestSuccess Цель: Проверить вход существующего пользователя. Логин: cili123 Пароль: cili123456 Ожидаемый результат: Успешная авторизация Фактический результат: Тест пройден. Пользователь успешно авторизован.
2. AuthTestNoLogin Цель: Проверить обработку пустого поля "Логин". Логин: Пароль: password123 Ожидаемый результат: Сообщение: "Введите логин!". Фактический результат: Тест пройден. Система корректно блокирует вход.
3. AuthTestNoPassword Цель: Проверить обработку пустого поля "Пароль". Логин: user1 Пароль: Ожидаемый результат: Сообщение: "Введите пароль!". Фактический результат: Тест пройден. Система блокирует вход.
4. AuthTestUnregisteredUser Цель: Проверить обработку несуществующего пользователя. Логин: chel Пароль: chel12324 Ожидаемый результат: Сообщение: "Пользователь не найден!". Фактический результат: Тест пройден.

Система корректно отклоняет вход.
![image](https://github.com/user-attachments/assets/e8bf75df-5bd3-42a8-9ad3-0dd97ff274a1)

# Регистрация
1. Успешная регистрация Цель: Проверить регистрацию нового пользователя с корректными данными. Логин: alex Email: alex@example.com Пароль: alex123456! Ожидаемый результат: Успешная регистрация Фактический результат: Тест пройден. Регистрация успешна.
2. Регистрация с существующим email Цель: Проверить обработку регистрации с уже существующим email. Логин: mixa Email: alex@example.com Пароль: mixa123456 Ожидаемый результат: Ошибка "Email уже используется". Фактический результат: Тест пройден. Система корректно блокирует регистрацию.
3. Регистрация с паролем из только цифр Цель: Проверить валидацию пароля на наличие букв. Логин: ivan Email: ivan@example.com Пароль: 1234567890 Ожидаемый результат: Ошибка "Пароль должен содержать буквы!". Фактический результат: Тест пройден. Система требует пароль с буквами и цифрами.
4. Регистрация с существующим логином Цель: Проверить обработку регистрации с уже существующим логином. Логин: ivan Email: leo@example.com Пароль: leo12345678 Ожидаемый результат: Ошибка "Пользователь уже существует!". Фактический результат: Тест пройден. Система корректно блокирует регистрацию.
5. Регистрация с коротким паролем Цель: Проверить валидацию пароля на минимальную длину. Логин: zolo Email: sergey@example.com Пароль: s123 Ожидаемый результат: Ошибка "Пароль должен быть длиннее 6 символов!". Фактический результат: Тест пройден. Система требует пароль не менее 6 символов.

![image](https://github.com/user-attachments/assets/481680d4-e01d-49d4-b4c4-cef1b695d601)
![image](https://github.com/user-attachments/assets/bbf41529-926c-4307-be2e-81f8a8201f69)
![image](https://github.com/user-attachments/assets/33798e30-615e-4905-a9a9-60ff4881c692)
![image](https://github.com/user-attachments/assets/a35bc03e-8c9f-44bf-9639-ed1f25ab277f)




