using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using poliklinika;
using System.Linq;
using System.Windows;
using Moq;
using System.Windows.Controls;


namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestClass]
        public class AuthTests
        {
            [TestMethod]
            public void AuthTestSuccess()
            {
                var authPage = new Auth();
                string validLogin = "cili123;
                string validPassword = "cili123456";

                bool result = authPage.Auth(validLogin, validPassword);

                Assert.IsTrue(result, "Авторизация должна быть успешной для существующего пользователя");
            }

            [TestMethod]
            public void AuthTest()
            {
                var authPage = new Auth();

                // Тест с пустым логином
                bool result1 = authPage.Auth("", "password123");
                Assert.IsFalse(result1, "Тест с пустым логином должен вернуть false");

                // Тест с пустым паролем
                bool result2 = authPage.Auth("user1", "");
                Assert.IsFalse(result2, "Тест с пустым паролем должен вернуть false");

                // Тест с неверными данными
                bool result3 = authPage.Auth("nonexistent", "wrongpassword");
                Assert.IsFalse(result3, "Тест с неверными данными должен вернуть false");
            }

            [TestMethod]
            public void AuthTestNoLogin()
            {
                var authPage = new Auth();

                bool result = authPage.Auth("", "qqqqq123456");

                Assert.IsFalse(result, "Авторизация без логина должна быть невозможна");
            }

            [TestMethod]
            public void AuthTestNoPassword()
            {
                var authPage = new Auth();

                bool result = authPage.Auth("wwww", "");

                Assert.IsFalse(result, "Авторизация без пароля должна быть невозможна");
            }

            [TestMethod]
            public void AuthTestUnregisteredUser()
            {
                var authPage = new Auth();

                bool result = authPage.Auth("terot", "terot2324");

                Assert.IsFalse(result, "Авторизация незарегистрированного пользователя должна быть невозможна");
            }

        }
    }
}