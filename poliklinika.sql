USE [Поликлиника]
GO
/****** Object:  Table [dbo].[appointments]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointments](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[schedule_id] [int] NOT NULL,
	[appointment_date] [date] NOT NULL,
	[appointment_time] [time](7) NOT NULL,
	[status] [varchar](20) NULL,
	[symptoms] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cabinets]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cabinets](
	[cabinet_id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](10) NOT NULL,
	[floor] [int] NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[cabinet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diagnoses]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnoses](
	[diagnosis_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[diagnosis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctors]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctors](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NULL,
	[specialty_id] [int] NOT NULL,
	[license_number] [varchar](20) NULL,
	[experience_years] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medical_records]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medical_records](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_id] [int] NOT NULL,
	[diagnosis_id] [int] NULL,
	[treatment] [nvarchar](max) NULL,
	[prescriptions] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patients]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NULL,
	[birth_date] [date] NOT NULL,
	[gender] [char](1) NOT NULL,
	[address] [text] NULL,
	[phone] [varchar](15) NULL,
	[email] [varchar](50) NULL,
	[insurance_number] [varchar](20) NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provided_services]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provided_services](
	[provided_service_id] [int] IDENTITY(1,1) NOT NULL,
	[record_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[provided_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[provided_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedules]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedules](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[cabinet_id] [int] NOT NULL,
	[day_of_week] [varchar](2) NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [text] NULL,
	[cost] [decimal](10, 2) NOT NULL,
	[duration_minutes] [int] NOT NULL,
	[specialty_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialties]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialties](
	[specialty_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[specialty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07.05.2025 9:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[appointments] ON 

INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (1, 1, 1, 1, CAST(N'2023-05-15' AS Date), CAST(N'09:30:00' AS Time), N'Завершен', N'Кашель, температура 37.5')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (2, 2, 2, 3, CAST(N'2023-05-17' AS Date), CAST(N'08:30:00' AS Time), N'Завершен', N'Боли в животе')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (3, 3, 3, 5, CAST(N'2023-05-19' AS Date), CAST(N'10:30:00' AS Time), N'Завершен', N'Боли в сердце')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (4, 4, 4, 7, CAST(N'2023-05-22' AS Date), CAST(N'09:00:00' AS Time), N'Завершен', N'Головные боли')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (5, 5, 5, 9, CAST(N'2023-05-24' AS Date), CAST(N'10:00:00' AS Time), N'Завершен', N'Ухудшение зрения')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (6, 6, 1, 2, CAST(N'2023-05-16' AS Date), CAST(N'14:30:00' AS Time), N'Завершен', N'Насморк, боль в горле')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (7, 7, 2, 4, CAST(N'2023-05-18' AS Date), CAST(N'13:30:00' AS Time), N'Завершен', N'Травма руки')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (8, 8, 3, 6, CAST(N'2023-05-20' AS Date), CAST(N'09:30:00' AS Time), N'Завершен', N'Одышка')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (9, 9, 4, 8, CAST(N'2023-05-23' AS Date), CAST(N'14:00:00' AS Time), N'Завершен', N'Головокружение')
INSERT [dbo].[appointments] ([appointment_id], [patient_id], [doctor_id], [schedule_id], [appointment_date], [appointment_time], [status], [symptoms]) VALUES (10, 10, 5, 10, CAST(N'2023-05-25' AS Date), CAST(N'15:00:00' AS Time), N'Запланирован', N'Покраснение глаз')
SET IDENTITY_INSERT [dbo].[appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[cabinets] ON 

INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (1, N'101', 1, N'Терапевтический кабинет')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (2, N'102', 1, N'Процедурный кабинет')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (3, N'201', 2, N'Хирургический кабинет')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (4, N'202', 2, N'Перевязочная')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (5, N'301', 3, N'Кардиологический кабинет')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (6, N'302', 3, N'Кабинет ЭКГ')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (7, N'401', 4, N'Неврологический кабинет')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (8, N'402', 4, N'Кабинет физиотерапии')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (9, N'501', 5, N'Офтальмологический кабинет')
INSERT [dbo].[cabinets] ([cabinet_id], [number], [floor], [description]) VALUES (10, N'502', 5, N'Кабинет диагностики зрения')
SET IDENTITY_INSERT [dbo].[cabinets] OFF
GO
SET IDENTITY_INSERT [dbo].[diagnoses] ON 

INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (1, N'J06.9', N'ОРВИ', N'Острая респираторная вирусная инфекция неуточненная')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (2, N'K57.3', N'Дивертикулез толстой кишки', N'Дивертикулярная болезнь толстой кишки без прободения или абсцесса')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (3, N'I20.9', N'Стенокардия', N'Стенокардия неуточненная')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (4, N'G44.2', N'Головная боль напряжения', N'Головная боль напряжения')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (5, N'H52.1', N'Миопия', N'Близорукость')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (6, N'J02.9', N'Острый фарингит', N'Острый фарингит неуточненный')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (7, N'S61.4', N'Открытая рана пальца', N'Открытая рана пальца с повреждением ногтя')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (8, N'I50.9', N'Сердечная недостаточность', N'Сердечная недостаточность неуточненная')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (9, N'G45.9', N'Преходящая ишемия мозга', N'Преходящая транзиторная церебральная ишемическая атака')
INSERT [dbo].[diagnoses] ([diagnosis_id], [code], [name], [description]) VALUES (10, N'H10.9', N'Конъюнктивит', N'Конъюнктивит неуточненный')
SET IDENTITY_INSERT [dbo].[diagnoses] OFF
GO
SET IDENTITY_INSERT [dbo].[doctors] ON 

INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (1, N'Иван', N'Петров', N'Сергеевич', 1, N'ЛТ123456', 15)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (2, N'Елена', N'Смирнова', N'Викторовна', 2, N'ЛТ654321', 20)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (3, N'Алексей', N'Иванов', N'Дмитриевич', 3, N'ЛТ789012', 10)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (4, N'Ольга', N'Кузнецова', N'Александровна', 4, N'ЛТ345678', 12)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (5, N'Дмитрий', N'Соколов', N'Игоревич', 5, N'ЛТ901234', 8)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (6, N'Мария', N'Попова', N'Олеговна', 6, N'ЛТ567890', 17)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (7, N'Сергей', N'Лебедев', N'Васильевич', 7, N'ЛТ234567', 14)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (8, N'Анна', N'Козлова', N'Сергеевна', 8, N'ЛТ890123', 9)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (9, N'Андрей', N'Новиков', N'Павлович', 9, N'ЛТ456789', 11)
INSERT [dbo].[doctors] ([doctor_id], [first_name], [last_name], [middle_name], [specialty_id], [license_number], [experience_years]) VALUES (10, N'Наталья', N'Морозова', N'Денисовна', 10, N'ЛТ012345', 16)
SET IDENTITY_INSERT [dbo].[doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[medical_records] ON 

INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (1, 1, 1, N'Постельный режим, обильное питье', N'Парацетамол 500 мг 3 раза в день, витамин С')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (2, 2, 2, N'Диета, наблюдение', N'Спазмолитики при болях')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (3, 3, 3, N'Ограничение физической нагрузки', N'Нитроглицерин, бета-блокаторы')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (4, 4, 4, N'Режим труда и отдыха', N'Обезболивающие при необходимости')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (5, 5, 5, N'Коррекция зрения', N'Очки -2.5 диоптрии')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (6, 6, 6, N'Полоскание горла', N'Антисептики для горла')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (7, 7, 7, N'Перевязки', N'Антибиотики, обработка раны')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (8, 8, 8, N'Ограничение жидкости', N'Диуретики, сердечные гликозиды')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (9, 9, 9, N'Наблюдение невролога', N'Сосудорасширяющие препараты')
INSERT [dbo].[medical_records] ([record_id], [appointment_id], [diagnosis_id], [treatment], [prescriptions]) VALUES (10, 10, 10, N'Противовоспалительные капли', N'Глазные капли 3 раза в день')
SET IDENTITY_INSERT [dbo].[medical_records] OFF
GO
SET IDENTITY_INSERT [dbo].[patients] ON 

INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (1, N'Александр', N'Васильев', N'Игоревич', CAST(N'1985-03-15' AS Date), N'М', N'ул. Ленина, 10, кв. 5', N'+79161234567', N'vasilev@mail.ru', N'ИН1234567890', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (2, N'Екатерина', N'Федорова', N'Алексеевна', CAST(N'1990-07-22' AS Date), N'Ж', N'ул. Пушкина, 15, кв. 12', N'+79162345678', N'fedorova@gmail.com', N'ИН2345678901', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (3, N'Михаил', N'Николаев', N'Сергеевич', CAST(N'1978-11-30' AS Date), N'М', N'ул. Гагарина, 5, кв. 3', N'+79163456789', N'nikolaev@yandex.ru', N'ИН3456789012', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (4, N'Ольга', N'Павлова', N'Дмитриевна', CAST(N'1995-05-18' AS Date), N'Ж', N'ул. Советская, 20, кв. 7', N'+79164567890', N'pavlova@mail.ru', N'ИН4567890123', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (5, N'Артем', N'Киселев', N'Андреевич', CAST(N'1982-09-10' AS Date), N'М', N'ул. Мира, 12, кв. 9', N'+79165678901', N'kiselev@gmail.com', N'ИН5678901234', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (6, N'Юлия', N'Орлова', N'Викторовна', CAST(N'1992-12-05' AS Date), N'Ж', N'ул. Садовая, 8, кв. 11', N'+79166789012', N'orlova@yandex.ru', N'ИН6789012345', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (7, N'Денис', N'Андреев', N'Олегович', CAST(N'1988-04-25' AS Date), N'М', N'ул. Центральная, 3, кв. 4', N'+79167890123', N'andreev@mail.ru', N'ИН7890123456', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (8, N'Анастасия', N'Макарова', N'Игоревна', CAST(N'1998-08-12' AS Date), N'Ж', N'ул. Лесная, 7, кв. 6', N'+79168901234', N'makarova@gmail.com', N'ИН8901234567', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (9, N'Павел', N'Захаров', N'Александрович', CAST(N'1975-01-20' AS Date), N'М', N'ул. Школьная, 9, кв. 8', N'+79169012345', N'zakharov@yandex.ru', N'ИН9012345678', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (10, N'Виктория', N'Семенова', N'Павловна', CAST(N'1980-06-08' AS Date), N'Ж', N'ул. Парковая, 11, кв. 10', N'+79160123456', N'semenova@mail.ru', N'ИН0123456789', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (11, N'Алексей', N'Чекушин', N'-', CAST(N'2006-02-14' AS Date), N'М', N'Псковская ул.', N'+79001231212', N'alex@mail.ru', N'ИН123243543', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (12, N'Сергей', N'Куклешов', N'Иванович', CAST(N'1983-12-06' AS Date), N'М', N'ул. Сущевский вал', N'+79001231212', N'ser@mail.ru', N'12345645', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (13, N'Анастасия', N'Олешенко', N'Яновна', CAST(N'1979-05-24' AS Date), N'Ж', N'ул. Крокодилова', N'+79884562343', N'Nastya@mail.ru', N'12321423442', 3)
INSERT [dbo].[patients] ([patient_id], [first_name], [last_name], [middle_name], [birth_date], [gender], [address], [phone], [email], [insurance_number], [RoleID]) VALUES (17, N'Алексей', N'Свиридов', N'Викторович', CAST(N'2000-02-11' AS Date), N'М', N'ул. Московная', N'+79009878787', N'svirid@mail.ru', N'123456СТР', 3)
SET IDENTITY_INSERT [dbo].[patients] OFF
GO
SET IDENTITY_INSERT [dbo].[provided_services] ON 

INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (1, 1, 1, 1, CAST(N'2023-05-15' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (2, 1, 5, 1, CAST(N'2023-05-15' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (3, 2, 2, 1, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (4, 2, 4, 1, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (5, 3, 3, 1, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (6, 4, 10, 1, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (7, 5, 9, 1, CAST(N'2023-05-24' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (8, 6, 1, 1, CAST(N'2023-05-16' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (9, 7, 6, 1, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[provided_services] ([provided_service_id], [record_id], [service_id], [quantity], [provided_date]) VALUES (10, 8, 3, 1, CAST(N'2023-05-20' AS Date))
SET IDENTITY_INSERT [dbo].[provided_services] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (2, N'Пациент')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (3, N'Врач')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[schedules] ON 

INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (1, 1, 1, N'Пн', CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (2, 1, 1, N'Вт', CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (3, 2, 3, N'Ср', CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (4, 2, 3, N'Чт', CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (5, 3, 5, N'Пт', CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (6, 3, 5, N'Сб', CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (7, 4, 7, N'Пн', CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (8, 4, 7, N'Вт', CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (9, 5, 9, N'Ср', CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[schedules] ([schedule_id], [doctor_id], [cabinet_id], [day_of_week], [start_time], [end_time]) VALUES (10, 5, 9, N'Чт', CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[services] ON 

INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (1, N'Консультация терапевта', N'Первичный прием терапевта', CAST(1500.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (2, N'Консультация хирурга', N'Первичный прием хирурга', CAST(2000.00 AS Decimal(10, 2)), 30, 2)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (3, N'ЭКГ', N'Электрокардиограмма', CAST(1200.00 AS Decimal(10, 2)), 20, 3)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (4, N'УЗИ брюшной полости', N'Ультразвуковое исследование', CAST(2500.00 AS Decimal(10, 2)), 40, 7)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (5, N'Анализ крови общий', N'Общий клинический анализ крови', CAST(800.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (6, N'Перевязка', N'Перевязка раны', CAST(500.00 AS Decimal(10, 2)), 15, 2)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (7, N'Измерение давления', N'Измерение артериального давления', CAST(300.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (8, N'Инъекция внутримышечная', N'Внутримышечная инъекция', CAST(400.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (9, N'Осмотр глазного дна', N'Офтальмоскопия', CAST(1500.00 AS Decimal(10, 2)), 20, 5)
INSERT [dbo].[services] ([service_id], [name], [description], [cost], [duration_minutes], [specialty_id]) VALUES (10, N'Спирометрия', N'Исследование функции внешнего дыхания', CAST(1800.00 AS Decimal(10, 2)), 25, 4)
SET IDENTITY_INSERT [dbo].[services] OFF
GO
SET IDENTITY_INSERT [dbo].[specialties] ON 

INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (1, N'Терапевт', N'Общая диагностика и лечение заболеваний')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (2, N'Хирург', N'Оперативное лечение заболеваний')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (3, N'Кардиолог', N'Диагностика и лечение сердечно-сосудистых заболеваний')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (4, N'Невролог', N'Диагностика и лечение заболеваний нервной системы')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (5, N'Офтальмолог', N'Диагностика и лечение заболеваний глаз')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (6, N'Отоларинголог', N'Диагностика и лечение заболеваний уха, горла и носа')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (7, N'Гастроэнтеролог', N'Диагностика и лечение заболеваний ЖКТ')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (8, N'Эндокринолог', N'Диагностика и лечение заболеваний эндокринной системы')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (9, N'Дерматолог', N'Диагностика и лечение заболеваний кожи')
INSERT [dbo].[specialties] ([specialty_id], [name], [description]) VALUES (10, N'Педиатр', N'Лечение детей до 18 лет')
SET IDENTITY_INSERT [dbo].[specialties] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (1, N'Пациент', N'11DF8F9AB4B02807C8712219A4BE8C6935EAA525', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (2, N'Администратор', N'11DF8F9AB4B02807C8712219A4BE8C6935EAA525', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (3, N'Врач', N'11DF8F9AB4B02807C8712219A4BE8C6935EAA525', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (4, N'test', N'7288EDD0FC3FFCBE93A0CF06E3568E28521687BC', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__cabinets__FD291E41657DAB99]    Script Date: 07.05.2025 9:18:17 ******/
ALTER TABLE [dbo].[cabinets] ADD UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__diagnose__357D4CF99AA9C86F]    Script Date: 07.05.2025 9:18:17 ******/
ALTER TABLE [dbo].[diagnoses] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__doctors__D482A0039D7E29D6]    Script Date: 07.05.2025 9:18:17 ******/
ALTER TABLE [dbo].[doctors] ADD UNIQUE NONCLUSTERED 
(
	[license_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__patients__9FC6C63EC66D58F1]    Script Date: 07.05.2025 9:18:17 ******/
ALTER TABLE [dbo].[patients] ADD UNIQUE NONCLUSTERED 
(
	[insurance_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E41CE0A5AB]    Script Date: 07.05.2025 9:18:17 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[appointments] ADD  DEFAULT ('Запланирован') FOR [status]
GO
ALTER TABLE [dbo].[provided_services] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([patient_id])
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD FOREIGN KEY([schedule_id])
REFERENCES [dbo].[schedules] ([schedule_id])
GO
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD FOREIGN KEY([specialty_id])
REFERENCES [dbo].[specialties] ([specialty_id])
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD FOREIGN KEY([appointment_id])
REFERENCES [dbo].[appointments] ([appointment_id])
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD FOREIGN KEY([diagnosis_id])
REFERENCES [dbo].[diagnoses] ([diagnosis_id])
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[provided_services]  WITH CHECK ADD FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
GO
ALTER TABLE [dbo].[provided_services]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([service_id])
GO
ALTER TABLE [dbo].[schedules]  WITH CHECK ADD FOREIGN KEY([cabinet_id])
REFERENCES [dbo].[cabinets] ([cabinet_id])
GO
ALTER TABLE [dbo].[schedules]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD FOREIGN KEY([specialty_id])
REFERENCES [dbo].[specialties] ([specialty_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD CHECK  (([status]='Отменен' OR [status]='Завершен' OR [status]='Запланирован'))
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD CHECK  (([gender]='Ж' OR [gender]='М'))
GO
ALTER TABLE [dbo].[schedules]  WITH CHECK ADD CHECK  (([day_of_week]='Сб' OR [day_of_week]='Пт' OR [day_of_week]='Чт' OR [day_of_week]='Ср' OR [day_of_week]='Вт' OR [day_of_week]='Пн'))
GO
USE [master]
GO
ALTER DATABASE [Поликлиника] SET  READ_WRITE 
GO
