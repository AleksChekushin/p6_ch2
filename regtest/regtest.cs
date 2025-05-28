using Microsoft.VisualStudio.TestTools.UnitTesting;
using poliklinika;
using System;

namespace regtest
{
    [TestClass]
    public class PegTest
    {
        [TestMethod]
        public void RegTestSuccess()
        {
            var regPage = new Reg();
            bool result = regPage.Register(
                "alex",
                "Алексей",
                "Чекушин",
                "alex@example.com",
                "+79001232323",
                "alex123456!",
                "alex123456!");

            Assert.IsTrue(result, "Регистрация должна быть успешной при корректных данных");
        }

        [TestMethod]
        public void RegTestExistingEmail()
        {
            var regPage = new Reg();
            bool result = regPage.Register(
                "mixa",
                "Михаил",
                "Хромой",
                "alex@example.com",
                "+79999999999",
                "mixa123456",
                "mixa123456");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при существующем email");
        }

        [TestMethod]
        public void RegTestNumericPassword()
        {
            var regPage = new Reg();
            bool result = regPage.Register(
                "ivan",
                "Иван",
                "Иванов",
                "ivan@example.com",
                "+79881232323",
                "1234567890",
                "1234567890");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при пароле из только цифр");
        }

        [TestMethod]
        public void RegTestExistingLogin()
        {
            var regPage = new Reg();
            bool result = regPage.Register(
                "ivan",
                "Леонид",
                "Ахмедов",
                "leo@example.com",
                "+79233454343",
                "leo12345678",
                "leo12345678");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при существующем логине");
        }

        [TestMethod]
        public void RegTestShortPassword()
        {
            var regPage = new Reg();
            bool result = regPage.Register(
                "zolo",
                "Сергей",
                "Золотарев",
                "sergey@example.com",
                "+79342342323",
                "s123",
                "s123");

            Assert.IsFalse(result, "Регистрация должна завершиться ошибкой при коротком пароле");
        }
    }
}