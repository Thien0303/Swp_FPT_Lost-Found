CREATE DATABASE FPTU_Lost_and_Found
GO

USE FPTU_Lost_and_Found
GO

CREATE TABLE Member
(
	MemberID varchar(30) PRIMARY KEY,	
	FullName nvarchar(50),
	Email varchar(50) NOT NULL,
	Picture varchar(200),
	ProfileInfo nvarchar(max),
	MemberRole decimal(1, 0) NOT NULL,
	MemberStatus decimal(1, 0) NOT NULL,
	CountTime int NOT NULL,	
);
--1
CREATE TABLE ArticleType
(
	ArticleTypeID decimal(1, 0) PRIMARY KEY,
	ArticleTypeName nvarchar(30) NOT NULL,	
);
--2
CREATE TABLE ItemType
(
	ItemID int IDENTITY(1,1) PRIMARY KEY,
	ItemName nvarchar(20) NOT NULL,	
);
--3
CREATE TABLE Article
(
	ArticleID int IDENTITY(1,1) PRIMARY KEY,
	ArticleTitle nvarchar(50) NOT NULL,
	ArticleContent nvarchar(max) NOT NULL,
	ImgURL varchar(50),
	PostTime DateTime NOT NULL,
	ArticleStatus decimal(1, 0) NOT NULL,
	WarningStatus decimal(1, 0) NOT NULL,
	MemberID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ArticleTypeID decimal(1, 0) NOT NULL FOREIGN KEY REFERENCES ArticleType(ArticleTypeID),
	ItemID int FOREIGN KEY REFERENCES ItemType(ItemID),
);
--4

CREATE TABLE Comment
(
	CommentID int IDENTITY(1,1) primary key,
	ArticleID int NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),	
	CommentContent nvarchar(500) NOT NULL,
	CommentTime DateTime NOT NULL,
	CommentStatus decimal(1, 0) NOT NULL
);
--5
CREATE TABLE Notification
(
	NotificationID int IDENTITY(1,1) primary key,
	SenderID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),	
	ReceiverID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
	ArticleID int FOREIGN KEY REFERENCES Article(ArticleID),
	NotificationContent nvarchar(100) NOT NULL,
	NotificationTime DateTime NOT NULL,
	NotificationStatus decimal(1, 0) NOT NULL
);
--6
CREATE TABLE Report
(
	ReportID int IDENTITY(1,1) primary key,
	ReportContent nvarchar(200) NOT NULL,
	ReportTime DateTime NOT NULL,
	ConfirmTime DateTime,
	ReportStatus decimal(1, 0) NOT NULL,
	ArticleID int NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	MemberID varchar(30) NOT NULL FOREIGN KEY REFERENCES Member(MemberID),
);
--7
CREATE TABLE Hashtag
(
	HashtagID int IDENTITY(1,1) primary key,
	HashtagName varchar(31) NOT NULL ,	
);
--8
CREATE TABLE ArticleHashtag
(
	ArticleID int  NOT NULL FOREIGN KEY REFERENCES Article(ArticleID),
	HashtagID int  NOT NULL FOREIGN KEY REFERENCES Hashtag(HashtagID),	
);
--9
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [ProfileInfo], [MemberRole], [MemberStatus], [CountTime]) VALUES (N'101545683166224559624', N'Nguyen Huu Giau (K15 HCM)', N'giaunhse150014@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AFdZucr0vKk1lLRYEO2FCaREBXxbsRg7vlt47pWkUp8yzQ=s96-c', N'Profile', CAST(1 AS Decimal(1, 0)), CAST(1 AS Decimal(1, 0)), 0)
GO
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [ProfileInfo], [MemberRole], [MemberStatus], [CountTime]) VALUES (N'107703834893877697636', N'Nguyen Ho Tien Dat (Admin)', N'datnhtse151251@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AFdZucpEBd4TyU2nmWr18poSEf1H1oLCe80oM6UzuYkIHg=s96-c', N'Profile', CAST(0 AS Decimal(1, 0)), CAST(1 AS Decimal(1, 0)), 0)
GO
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [ProfileInfo], [MemberRole], [MemberStatus], [CountTime]) VALUES (N'109377370807180139934', N'Le Minh Thien (K15 HCM)', N'thienlmse151226@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AFdZucrq2hKJ3hJEx8bapkTndjxZBD7UtjeU9HJZ-ggZ=s96-c', N'Profile', CAST(1 AS Decimal(1, 0)), CAST(1 AS Decimal(1, 0)), 0)
GO
INSERT [dbo].[Member] ([MemberID], [FullName], [Email], [Picture], [ProfileInfo], [MemberRole], [MemberStatus], [CountTime]) VALUES (N'114512282810993535016', N'Nguyen Trong Nguyen (K15 HCM)', N'nguyenntse151227@fpt.edu.vn', N'https://lh3.googleusercontent.com/a-/AFdZucq8AE_Qyz_NFqizS1RHZofrBHaptjW7m57dRsxj=s96-c', N'Profile', CAST(1 AS Decimal(1, 0)), CAST(1 AS Decimal(1, 0)), 0)
GO

INSERT [dbo].[ArticleType] ([ArticleTypeID], [ArticleTypeName]) VALUES (CAST(1 AS Decimal(1, 0)), N'LOST')
GO
INSERT [dbo].[ArticleType] ([ArticleTypeID], [ArticleTypeName]) VALUES (CAST(2 AS Decimal(1, 0)), N'FOUND')
GO
INSERT [dbo].[ArticleType] ([ArticleTypeID], [ArticleTypeName]) VALUES (CAST(3 AS Decimal(1, 0)), N'NOTICE')
GO

set Identity_insert [dbo].[ItemType] on
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (1, N'Laptop')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (2, N'Phone')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (3, N'Key')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (4, N'Student Card')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (5, N'Wallet')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (6, N'Document/Book')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (7, N'Money')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (8, N'Backpack/Hand bag')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (9, N'Outfit')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (10, N'Accessory')
GO
INSERT [dbo].[ItemType] ([ItemID], [ItemName]) VALUES (11, N'Water bottle')
GO
set Identity_insert [dbo].[ItemType] off


set Identity_insert [dbo].[Article] on 
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (1, N'C???n t??m balo ??? khu v???c th?? vi???n', N'<p>V&agrave;o ng&agrave;y h&ocirc;m qua m&igrave;nh c&oacute; ??&aacute;nh r??i 1 chi???c balo m&agrave;u ??en nh?? h&igrave;nh ??? khu v???c th?? vi???n.</p><p>N???u ai c&oacute; t&igrave;m th???y th&igrave; vui l&ograve;ng li&ecirc;n h??? cho m&igrave;nh xin l???i ???.</p>', N'balo.jpg', CAST(N'2022-07-31T19:32:54.777' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(1 AS Decimal(1, 0)), 8)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (2, N'C???n gi??p t??m l???i c??i ??o FPT ???', N'<p>V&agrave;o chi???u bu???i h???c h&ocirc;m qua m&igrave;nh c&oacute; ????? qu&ecirc;n c&aacute;i &aacute;o FPT nh?? h&igrave;nh ??? ch??? khu v???c h???i tr?????ng ???.&nbsp;</p><p>Ai nh???t ???????c th&igrave; vui l&ograve;ng li&ecirc;n h??? m&igrave;nh v???i ???.</p><p>Xin ch&acirc;n th&agrave;nh c???m ??n.</p>', N'trangphuc.jpg', CAST(N'2022-07-31T19:37:27.677' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(1 AS Decimal(1, 0)), 9)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (3, N'C???n t??m gi??p g???p chi???c laptop', N'<p>V&agrave;o ng&agrave;y 25/07/2022 m&igrave;nh c&oacute; ?????t chi???c laptop trong ph&ograve;ng h???c 116 v&agrave; xu???ng c??n tin mua ????? th&igrave; khi quay l???i l???p th&igrave; c&aacute;c b???n c??ng ra v??? h???t v&agrave; c&ograve;n l???i m???i m&igrave;nh ch??a thu d???n ????? ????? ra v???. C??ng l&uacute;c ??&oacute; l&agrave; m&igrave;nh ??&atilde; kh&ocirc;ng c&ograve;n th???y chi???c Laptop c???a m&igrave;nh n???a. M&igrave;nh c??ng ??&atilde; li&ecirc;n l???c v???i c&aacute;c b???n v&agrave; gi&aacute;o vi&ecirc;n trong l???p nh??ng kh&ocirc;ng nh???n ???????c k???t qu??? t&iacute;ch c???c n&agrave;o. N???u ai c&oacute; th&ocirc;ng tin v??? chi???c laptop n&agrave;y th&igrave; xin h&atilde;y li&ecirc;n h??? v???i m&igrave;nh ???.</p><p>M&igrave;nh xin ch&acirc;n th&agrave;nh c???m ??n.</p>', N'laptop.jpg', CAST(N'2022-07-31T19:41:50.100' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(1 AS Decimal(1, 0)), 1)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (4, N'????nh r??i ch??a kh??a khu v???c b??i g???i xe.', N'<p>V&agrave;o tr??a ng&agrave;y 20/07/2022 m&igrave;nh ??i xe m&aacute;y t???i tr?????ng v&agrave; g???i xe trong b&atilde;i ????? xe.</p><p>M&igrave;nh ngh?? ??&atilde; ??&aacute;nh r??i ch&igrave;a kh&oacute;a tr&ecirc;n ???????ng ??i t???i ph&ograve;ng h???c 132.</p><p>B???n n&agrave;o c&oacute; th???y ch&ugrave;m ch&igrave;a kh&oacute;a nh?? h&igrave;nh th&igrave; li&ecirc;n h??? m&igrave;nh xin l???i nha.</p><p>Xin c???m ??n ???.</p>', N'key.jpg', CAST(N'2022-07-31T19:46:18.797' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'114512282810993535016', CAST(1 AS Decimal(1, 0)), 3)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (5, N'????nh r??i v?? ??? khu v???c th?? vi???n', N'<p>Chi???u ng&agrave;y 17/07/2022 v&agrave;o kho???ng 16h00 m&igrave;nh c&oacute; ??&aacute;nh r??i c&aacute;i v&iacute; nh?? h&igrave;nh ??? khu v???c th?? vi???n ???.</p><p>B???n n&agrave;o nh???t ???????c th&igrave; cho m&igrave;nh xin l???i v???i ???.</p><p>M&igrave;nh c???m ??n nhi???u.</p>', N'vi.jpg', CAST(N'2022-07-31T19:51:12.183' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'114512282810993535016', CAST(1 AS Decimal(1, 0)), 5)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (6, N'????? qu??n b??nh n?????c ??? khu v???c s???nh tr???ng ?????ng', N'<p>S&aacute;ng ng&agrave;y 27/07/2022 m&igrave;nh c&oacute; ????? qu&ecirc;n c&aacute;i <strong>b&igrave;nh n?????c</strong> ??? ngay c???nh tr???ng ?????ng nh?? h&igrave;nh ???.</p><p>Ai nh???t ???????c th&igrave; li&ecirc;n h??? m&igrave;nh nh&eacute;.</p><p>M&igrave;nh xin c???m t??? nhi???u ^^.</p>', N'binhnuoc.jpg', CAST(N'2022-07-31T19:53:48.463' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'114512282810993535016', CAST(1 AS Decimal(1, 0)), 11)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (7, N'????nh r??i ??i???n tho???i ??? khu v???c h???i tr?????ng', N'<p>V&agrave;o bu???i h???p s&aacute;ng ng&agrave;y 20/07/2022 t???i <strong>h???i tr?????ng</strong> ch&iacute;nh m&igrave;nh c&oacute; ??&aacute;nh r??i con <strong>IPhone 13 Pro Max</strong> nh?? h&igrave;nh.&nbsp;</p><p>B???n n&agrave;o nh???t ???????c li&ecirc;n h??? m&igrave;nh g???p nh&eacute;.</p><p>M&igrave;nh xin c???m t??? nhi???u.</p>', N'phone.jpg', CAST(N'2022-07-31T19:58:19.900' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'101545683166224559624', CAST(1 AS Decimal(1, 0)), 2)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (8, N'????nh r??i th??? sinh vi??n', N'<p>V&agrave;o tr??a ng&agrave;y 15/07/2022 m&igrave;nh c&oacute; ??&aacute;nh r??i th??? sinh vi&ecirc;n ??? khu v???c nh&agrave; ??n c???a c??n tin ???.</p><p>B???n n&agrave;o nh???t ???????c th&igrave; cho m&igrave;nh xin l???i nh&eacute;. M&igrave;nh c???m ??n nhi???u.</p>', N'theSV.jpg', CAST(N'2022-07-31T20:01:20.090' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'101545683166224559624', CAST(1 AS Decimal(1, 0)), 4)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (9, N'????? qu??n c???p tai nghe ??? ph??ng h???c 207', N'<p>V&agrave;o bu???i h???c s&aacute;ng ng&agrave;y 24/07/2022 m&igrave;nh c&oacute; ????? qu&ecirc;n c???p<strong> tai nghe </strong>nh?? h&igrave;nh t???i <strong>room 207</strong> nh?? h&igrave;nh ???.</p><p>Ai c&oacute; nh???t ???????c th&igrave; vui l&ograve;ng li&ecirc;n h??? ????? m&igrave;nh xin l???i nh&eacute;.</p><p>M&igrave;nh c???m ??n nhi???u.</p>', N'TaiNghe.jpg', CAST(N'2022-07-31T20:04:24.450' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'101545683166224559624', CAST(1 AS Decimal(1, 0)), 10)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (10, N'Nh???t ???????c ch??a kh??a ??? b??i g???i xe', N'<p>V&agrave;o tr??a ng&agrave;y 20/07/2022 m&igrave;nh c&oacute; nh???t ???????c ch&igrave;a kh&oacute;a nh?? h&igrave;nh.</p><p>C???a b???n n&agrave;o th&igrave; li&ecirc;n h??? m&igrave;nh ????? nh???n l???i nh&eacute;.</p>', N'key.jpg', CAST(N'2022-07-31T20:08:25.160' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'101545683166224559624', CAST(2 AS Decimal(1, 0)), 3)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (11, N'Nh???t ???????c c??i c???p ??? th?? vi???n', N'<p>V&agrave;o chi???u ng&agrave;y 30/07/2022 m&igrave;nh c&oacute; nh???t ???????c c&aacute;i c???p nh?? h&igrave;nh ??? khu v???c th?? vi???n.</p><p>B???n n&agrave;o ????? qu&ecirc;n th&igrave; li&ecirc;n h??? m&igrave;nh ????? nh???n l???i nha.</p>', N'balo.jpg', CAST(N'2022-07-31T20:15:59.587' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'101545683166224559624', CAST(2 AS Decimal(1, 0)), 8)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (12, N'Nh???t ???????c b??nh n?????c ??? khu v???c s???nh tr???ng ?????ng', N'<p>S&aacute;ng ng&agrave;y 27/07/2022 m&igrave;nh c&oacute; nh???t ???????c c&aacute;i b&igrave;nh n?????c ??? s???nh tr???ng ?????ng nh?? h&igrave;nh.</p><p>B???n n&agrave;o ????? qu&ecirc;n th&igrave; li&ecirc;n h??? m&igrave;nh nh???n l???i nha.</p>', N'binhnuoc.jpg', CAST(N'2022-07-31T20:20:37.890' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'101545683166224559624', CAST(2 AS Decimal(1, 0)), 11)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (13, N'Nh???t ???????c c???p tai nghe ??? ph??ng h???c 207', N'<p>V&agrave;o bu???i s&aacute;ng ng&agrave;y 24/07/2022 m&igrave;nh c&oacute; nh???t ???????c c???p tai nghe nh?? h&igrave;nh ??? ph&ograve;ng 207.</p><p>B???n n&agrave;o ????? qu&ecirc;n li&ecirc;n h??? m&igrave;nh nh???n l???i nh&eacute;.</p>', N'TaiNghe.jpg', CAST(N'2022-07-31T21:39:19.070' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(2 AS Decimal(1, 0)), 10)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (14, N'Nh???t ???????c th??? sinh vi??n', N'<p>V&agrave;o ng&agrave;y 15/07/2022 m&igrave;nh c&oacute; nh???t ???????c th??? sinh vi&ecirc;n khu v???c nh&agrave; ??n ??? c??n tin.</p><p>B???n n&agrave;o ??&aacute;nh r??i th&igrave; li&ecirc;n h??? nh&eacute;.</p>', N'theSV.jpg', CAST(N'2022-07-31T21:44:45.103' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(2 AS Decimal(1, 0)), 4)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (15, N'Nh???t ???????c v?? ??? th?? vi???n', N'<p>Chi???u ng&agrave;y 17/07/2022 m&igrave;nh c&oacute; nh???t ???????c v&iacute; ??? th?? vi???n.</p><p>B???n n&agrave;o ??&aacute;nh r??i th&igrave; li&ecirc;n h??? m&igrave;nh nha.</p>', N'vi.jpg', CAST(N'2022-07-31T21:47:26.627' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(2 AS Decimal(1, 0)), 5)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (16, N'B??i vi???t mang n???i dung ph?? b??nh', N'<p>Qu???n tr??? vi&ecirc;n h??? th???ng ph???n h???i th&ocirc;ng tin ch???m l&agrave;m t&ocirc;i b???c m&igrave;nh.</p>', N'phebinh.jpg', CAST(N'2022-07-31T21:51:05.173' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'109377370807180139934', CAST(1 AS Decimal(1, 0)), 3)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (17, N'Nh???t ???????c IPhone 13 t???i h???i tr?????ng ch??nh', N'<p>S&aacute;ng ng&agrave;y 20/07/2022 t???i h???i tr?????ng ch&iacute;nh m&igrave;nh c&oacute; nh???t ???????c IPhone 13 ProMax nh?? h&igrave;nh.</p><p>B???n n&agrave;o ??&aacute;nh r??i th&igrave; li&ecirc;n h??? m&igrave;nh ????? nh???n l???i nha</p>', N'phone.jpg', CAST(N'2022-07-31T21:56:37.467' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'114512282810993535016', CAST(2 AS Decimal(1, 0)), 2)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (18, N'????? qu??n t??i li???u', N'<p>M&igrave;nh c&oacute; ????? qu&ecirc;n cu???n s&aacute;ch v&agrave;o h&ocirc;m qua.</p><p>&Agrave; qu&ecirc;n m&igrave;nh ??&ugrave;a c&aacute;c b???n th&ocirc;i ch??? n&oacute; ??? trong c???p m&igrave;nh m&agrave; =))</p>', N'book.jpg', CAST(N'2022-07-31T21:58:51.157' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'114512282810993535016', CAST(1 AS Decimal(1, 0)), 6)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (19, N'Th??ng b??o v??? c???p nh???t h??? th???ng l???n 1', N'<p>Th&ocirc;ng b&aacute;o b??? sung c???p nh???t l???n 1:</p><ol><li>C???i thi???n ch???t l?????ng h&igrave;nh ???nh</li><li>Giao di???n d??? nh&igrave;n h??n</li></ol><p>L???n c???p nh???t n&agrave;y s??? di???n ra trong kho???ng 3 ng&agrave;y t???i.</p><p>Th&ocirc;ng b&aacute;o ?????n to&agrave;n th??? m???i ng?????i.</p>', N'notice.jpg', CAST(N'2022-07-31T22:07:41.650' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'107703834893877697636', CAST(3 AS Decimal(1, 0)), NULL)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (20, N'Th??ng b??o v??? c???p nh???t h??? th???ng l???n 2', N'<p>Th&ocirc;ng b&aacute;o b??? sung c???p nh???t l???n 2:</p><ol><li>C???i thi???n ch???c n??ng th&ocirc;ng b&aacute;o.</li><li>Giao di???n th&acirc;n thi???n h??n.</li></ol><p>L???n c???p nh???t n&agrave;y s??? di???n ra trong th??? 7 tu???n t???i.</p><p>Th&ocirc;ng b&aacute;o ?????n to&agrave;n th??? m???i ng?????i.</p>', N'notice2.jpg', CAST(N'2022-07-31T22:09:24.783' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'107703834893877697636', CAST(3 AS Decimal(1, 0)), NULL)
GO
INSERT [dbo].[Article] ([ArticleID], [ArticleTitle], [ArticleContent], [ImgURL], [PostTime], [ArticleStatus], [WarningStatus], [MemberID], [ArticleTypeID], [ItemID]) VALUES (21, N'Th??ng b??o kh???n v??? vi???c b???o tr?? h??? th???ng', N'<p>Hi???n t???i h??? th???ng ??ang c???n s???a l???i m???t s??? ch???c n??ng.</p><p>H??? th???ng s??? m??? l???i sau v&agrave;i ti???ng, trong kho???ng th???i gian c&aacute;c b???n s??? b??? h???n ch??? 1 s??? ch???c n??ng.&nbsp;</p><p>Mong c&aacute;c b???n th&ocirc;ng c???m.</p>', N'notice3.jpg', CAST(N'2022-07-31T22:13:20.087' AS DateTime), CAST(1 AS Decimal(1, 0)), CAST(0 AS Decimal(1, 0)), N'107703834893877697636', CAST(3 AS Decimal(1, 0)), NULL)
GO
set Identity_insert [dbo].[Article] off
 
 set Identity_insert [dbo].[Comment] on
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [MemberID], [CommentContent], [CommentTime], [CommentStatus]) VALUES (1, 1, N'109377370807180139934', N'K??nh mong nh???n ???????c s??? gi??p ????? t??? m???i ng?????i ???.', CAST(N'2022-07-31T19:33:38.627' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
set Identity_insert [dbo].[Comment] off

set Identity_insert [dbo].[Notification] on
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (1, N'101545683166224559624', N'114512282810993535016', 10, N'posted articles related to Key', CAST(N'2022-07-31T20:08:25.400' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (2, N'101545683166224559624', N'109377370807180139934', 11, N'posted articles related to Backpack/Hand bag', CAST(N'2022-07-31T20:15:59.940' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (3, N'101545683166224559624', N'114512282810993535016', 12, N'posted articles related to Water bottle', CAST(N'2022-07-31T20:20:38.133' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (4, N'109377370807180139934', N'101545683166224559624', 13, N'posted articles related to Accessory', CAST(N'2022-07-31T21:39:20.047' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (5, N'109377370807180139934', N'101545683166224559624', 14, N'posted articles related to Student Card', CAST(N'2022-07-31T21:44:45.323' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (6, N'109377370807180139934', N'114512282810993535016', 15, N'posted articles related to Wallet', CAST(N'2022-07-31T21:47:26.837' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (7, N'109377370807180139934', N'101545683166224559624', 16, N'posted articles related to Key', CAST(N'2022-07-31T21:51:05.247' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (8, N'114512282810993535016', N'101545683166224559624', 17, N'posted articles related to Phone', CAST(N'2022-07-31T21:56:37.670' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (9, N'107703834893877697636', N'101545683166224559624', 19, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:07:41.703' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (10, N'107703834893877697636', N'109377370807180139934', 19, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:07:41.713' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (11, N'107703834893877697636', N'114512282810993535016', 19, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:07:41.720' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (12, N'107703834893877697636', N'101545683166224559624', 20, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:09:24.830' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (13, N'107703834893877697636', N'109377370807180139934', 20, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:09:24.840' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (14, N'107703834893877697636', N'114512282810993535016', 20, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:09:24.860' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (15, N'107703834893877697636', N'101545683166224559624', 21, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:13:20.153' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (16, N'107703834893877697636', N'109377370807180139934', 21, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:13:20.163' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
INSERT [dbo].[Notification] ([NotificationID], [SenderID], [ReceiverID], [ArticleID], [NotificationContent], [NotificationTime], [NotificationStatus]) VALUES (17, N'107703834893877697636', N'114512282810993535016', 21, N'The administrator has posted a notice about the system', CAST(N'2022-07-31T22:13:20.170' AS DateTime), CAST(1 AS Decimal(1, 0)))
GO
set Identity_insert [dbo].[Notification] off

set Identity_insert [dbo].[Hashtag] on
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (1, N'#Balo')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (2, N'#Library')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (3, N'#AoFPT')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (4, N'#HoiTruong')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (5, N'#LaptopASUS')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (6, N'#Room116')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (7, N'#Key')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (8, N'#BaiGuiXe')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (9, N'#')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (10, N'#Vi')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (11, N'#BinhNuoc')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (12, N'#TrongDong')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (13, N'#IPhone')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (14, N'#IPhone13ProMax')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (15, N'#NhaAn')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (16, N'#CanTin')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (17, N'#711')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (18, N'#TheSV')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (19, N'#Headphone')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (20, N'#Room207')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (21, N'#NhatDuoc')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (22, N'#ChiaKhoa')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (23, N'#Bag')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (24, N'#Cap')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (25, N'#StudentCard')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (26, N'#PheBinh')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (27, N'#QuenDo')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (28, N'#NoticeUpdate')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (29, N'#NoticeUpdate2')
GO
INSERT [dbo].[Hashtag] ([HashtagID], [HashtagName]) VALUES (30, N'#Notice3')
GO
set Identity_insert [dbo].[Hashtag] off

INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (1, 1)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (1, 2)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (2, 3)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (2, 4)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (3, 5)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (3, 6)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (4, 7)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (4, 8)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (4, 9)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (11, 23)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (11, 24)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (11, 2)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (11, 21)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (12, 21)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (12, 11)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (12, 12)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (13, 19)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (13, 20)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (14, 18)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (14, 17)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (14, 25)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (15, 10)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (15, 2)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (16, 26)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (17, 13)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (17, 14)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (17, 4)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (19, 28)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (20, 29)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (21, 30)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (5, 10)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (5, 2)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (6, 11)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (6, 12)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (7, 13)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (7, 14)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (7, 4)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (9, 19)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (9, 20)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (8, 15)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (8, 16)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (8, 17)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (8, 18)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (18, 27)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (10, 21)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (10, 7)
GO
INSERT [dbo].[ArticleHashtag] ([ArticleID], [HashtagID]) VALUES (10, 22)
GO







