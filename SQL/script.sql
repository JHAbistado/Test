USE [master]
GO
/****** Object:  Database [NATANIA]    Script Date: 16/05/2024 2:34:47 pm ******/
CREATE DATABASE [NATANIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NATANIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\NATANIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NATANIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\NATANIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NATANIA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NATANIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NATANIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NATANIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NATANIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NATANIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NATANIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [NATANIA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NATANIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NATANIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NATANIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NATANIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NATANIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NATANIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NATANIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NATANIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NATANIA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NATANIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NATANIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NATANIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NATANIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NATANIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NATANIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NATANIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NATANIA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NATANIA] SET  MULTI_USER 
GO
ALTER DATABASE [NATANIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NATANIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NATANIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NATANIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NATANIA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NATANIA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NATANIA] SET QUERY_STORE = ON
GO
ALTER DATABASE [NATANIA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NATANIA]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[acc_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](80) NULL,
	[password] [varchar](20) NULL,
	[is_verified] [int] NULL,
	[token] [varchar](100) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[phase] [varchar](2) NULL,
	[lot] [varchar](20) NULL,
	[block] [varchar](20) NULL,
	[street] [varchar](50) NULL,
	[barangay] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[province] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[postal_code] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email_Templates]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Templates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NULL,
	[template] [varchar](max) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Family_Member]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Family_Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NULL,
	[first_name] [varchar](80) NULL,
	[last_name] [varchar](40) NULL,
	[middle_name] [varchar](40) NULL,
	[suffix_name] [varchar](20) NULL,
	[age] [varchar](20) NULL,
	[gender] [varchar](30) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NULL,
	[amount] [int] NULL,
	[due_date] [varchar](50) NULL,
	[payment_date] [varchar](50) NULL,
	[receipt] [varchar](max) NULL,
	[date_paid] [varchar](50) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NULL,
	[name] [varchar](80) NULL,
	[type] [varchar](40) NULL,
	[breed] [varchar](80) NULL,
	[gender] [varchar](20) NULL,
	[is_vaccinated] [int] NULL,
	[picture] [varchar](max) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Profile]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[first_name] [varchar](80) NULL,
	[last_name] [varchar](40) NULL,
	[middle_name] [varchar](40) NULL,
	[suffix] [varchar](20) NULL,
	[email] [varchar](80) NULL,
	[age] [varchar](20) NULL,
	[gender] [varchar](30) NULL,
	[phone_no] [varchar](13) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner_id] [int] NULL,
	[type] [varchar](20) NULL,
	[brand] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[plate_no] [varchar](50) NULL,
	[orcr] [varchar](max) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([acc_id], [email], [password], [is_verified], [token], [status], [role]) VALUES (2, N'natania.app@outlook.com', N'NatApp2024*', 1, N'', 1, NULL)
INSERT [dbo].[Accounts] ([acc_id], [email], [password], [is_verified], [token], [status], [role]) VALUES (3, N'admin', N'admin', 1, N'', 1, 1)
INSERT [dbo].[Accounts] ([acc_id], [email], [password], [is_verified], [token], [status], [role]) VALUES (7, N'johnhenrickabistado12@gmail.com', N'NatApp2024**', 1, N'8yje12mr9ywvie7pprpyik', 1, 0)
INSERT [dbo].[Accounts] ([acc_id], [email], [password], [is_verified], [token], [status], [role]) VALUES (8, N'phptest715@gmail.com', N'Testpass24*', 1, N'', 1, 0)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [account_id], [phase], [lot], [block], [street], [barangay], [city], [province], [country], [postal_code]) VALUES (1, 2, N'1A', N'123', N'123', N'Willow', N'Punong Kawayan 1', N'General Trias', N'', N'Philippines', N'1210')
INSERT [dbo].[Address] ([id], [account_id], [phase], [lot], [block], [street], [barangay], [city], [province], [country], [postal_code]) VALUES (2, 4, N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Address] ([id], [account_id], [phase], [lot], [block], [street], [barangay], [city], [province], [country], [postal_code]) VALUES (3, 5, N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Address] ([id], [account_id], [phase], [lot], [block], [street], [barangay], [city], [province], [country], [postal_code]) VALUES (4, 6, N'1A', N'1', N'1', N'Red Wood', N'Pasong Kawayan 1', N'Trece', N'Cavite', N'Philippines', N'1210')
INSERT [dbo].[Address] ([id], [account_id], [phase], [lot], [block], [street], [barangay], [city], [province], [country], [postal_code]) VALUES (5, 7, N'1A', N'1', N'1', N'Red Wood', N'Pasong Kawayan 1', N'Trece', N'Cavite', N'Philippines', N'1407')
INSERT [dbo].[Address] ([id], [account_id], [phase], [lot], [block], [street], [barangay], [city], [province], [country], [postal_code]) VALUES (6, 8, N'', N'', N'', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Email_Templates] ON 

INSERT [dbo].[Email_Templates] ([id], [name], [template], [status]) VALUES (4, N'Reset Password', N'<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link rel=File-List href="reset_password_email_template_files/filelist.xml">
<link rel=Edit-Time-Data href="reset_password_email_template_files/editdata.mso">

<link rel=themeData href="reset_password_email_template_files/themedata.thmx">
<link rel=colorSchemeMapping
href="reset_password_email_template_files/colorschememapping.xml">

</head>

<body lang=EN-PH link="#467886" vlink="#96607D" style="tab-interval:36.0pt;
word-wrap:break-word">

<div class=WordSection1>


<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
 style="border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt">
 <tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:45.0pt">
  <td width=283 valign=top style="width:212.25pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:45.0pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=17 valign=top style="width:12.7pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=520 valign=top style="width:389.85pt;border:none;border-bottom:
  solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.15pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:1;height:6.55pt">
  <td width=283 valign=top style="width:212.25pt;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=17 valign=top style="width:12.7pt;border:none;mso-border-top-alt:
  solid windowtext 1.0pt;mso-border-left-alt:solid windowtext 1.0pt;background:
  #FF9933;padding:0cm 5.4pt 0cm 5.4pt;height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=520 valign=top style="width:389.85pt;border:none;mso-border-top-alt:
  solid windowtext 1.0pt;background:#FF9933;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.15pt;border:none;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext 1.0pt;background:#FF9933;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:2;height:167.8pt">
  <td width=283 valign=top style="width:212.25pt;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:167.8pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=17 valign=top style="width:12.7pt;border:none;mso-border-left-alt:
  solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:167.8pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=520 valign=top style="width:389.85pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:167.8pt">
  <p class=MsoNormal><span style="font-size:14.0pt;color:#FF9933"><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal><span style="font-size:14.0pt;color:#FF9933">RESET
  PASSWORD<o:p></o:p></span></p>
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  <p class=MsoNormal>We received a request to reset the password of your
  account<o:p></o:p></p>
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  <p class=MsoNormal>To reset your password, click on the button below:<o:p></o:p></p>
  <p class=MsoNormal><span style="mso-spacerun:yes"> </span><o:p></o:p></p>
	  <button class="MsoNormal"><a href="@link" style="text-decoration: none">Reset Password</a></button>
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  <p class=MsoNormal>If you didn’t request to reset your password, please ignore
  this email.<o:p></o:p></p>
  </td>
  <td width=19 valign=top style="width:14.15pt;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:167.8pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:3;mso-yfti-lastrow:yes;height:7.25pt">
  <td width=283 valign=top style="width:212.25pt;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=17 valign=top style="width:12.7pt;border:none;border-bottom:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=520 valign=top style="width:389.85pt;border:none;border-bottom:
  solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>
', 1)
INSERT [dbo].[Email_Templates] ([id], [name], [template], [status]) VALUES (6, N'Verify Email', N'<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link rel=File-List href="verify_email_template_files/filelist.xml">
<link rel=Edit-Time-Data href="verify_email_template_files/editdata.mso">

<link rel=themeData href="verify_email_template_files/themedata.thmx">
<link rel=colorSchemeMapping
href="verify_email_template_files/colorschememapping.xml">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-469750017 -1073732485 9 0 511 0;}
@font-face
	{font-family:Aptos;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:536871559 3 0 0 415 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Aptos;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#467886;
	mso-themecolor:hyperlink;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#96607D;
	mso-themecolor:followedhyperlink;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:12.0pt;
	mso-bidi-font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Aptos;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Aptos;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
-->
</style>

</head>

<body lang=EN-PH link="#467886" vlink="#96607D" style="tab-interval:36.0pt;
word-wrap:break-word">

<div class=WordSection1>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
 style="border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt">
 <tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:38.45pt">
  <td width=265 valign=top style="width:7.0cm;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:38.45pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.2pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:38.45pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=567 valign=top style="width:15.0cm;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:38.45pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=28 valign=top style="width:21.25pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:38.45pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:1;height:6.55pt">
  <td width=265 valign=top style="width:7.0cm;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.2pt;border:none;mso-border-top-alt:
  solid windowtext 1.0pt;mso-border-left-alt:solid windowtext 1.0pt;background:
  #FF9933;padding:0cm 5.4pt 0cm 5.4pt;height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=567 valign=top style="width:15.0cm;border:none;mso-border-top-alt:
  solid windowtext 1.0pt;background:#FF9933;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=28 valign=top style="width:21.25pt;border:none;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext 1.0pt;background:#FF9933;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.55pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:2;height:167.8pt">
  <td width=265 valign=top style="width:7.0cm;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:167.8pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.2pt;border:none;mso-border-left-alt:
  solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:167.8pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=567 valign=top style="width:15.0cm;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:167.8pt">
	  <p class=MsoNormal><span style="font-size:14.0pt;color:#FF9933"><o:p>&nbsp;</o:p></span></p>
	  <p class=MsoNormal><span style="font-size:14.0pt;color:#FF9933">VERIFY YOUR EMAIL<o:p></o:p></span></p>
	  <p class=MsoNormal><span style="font-size:14.0pt;color:#FF9933"><o:p>&nbsp;</o:p></span></p>
	  <p class=MsoNormal>Hi @first_name,<o:p></o:p></p>
	  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
	  <p class=MsoNormal>Thank you for signing up to Natania App.<o:p></o:p></p>
	  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
	  <p class=MsoNormal>
		  To activate your account, please verify your email by
		  clicking the button below:<o:p></o:p>
	  </p>
	  <p class=MsoNormal><span style="mso-spacerun:yes"> </span><o:p></o:p></p>
	  <button class="MsoNormal"><a href="@link" style="text-decoration: none">Verify</a></button>
	  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=28 valign=top style="width:21.25pt;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:167.8pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:3;mso-yfti-lastrow:yes;height:7.25pt">
  <td width=265 valign=top style="width:7.0cm;border:none;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=19 valign=top style="width:14.2pt;border:none;border-bottom:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=567 valign=top style="width:15.0cm;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
  <td width=28 valign=top style="width:21.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:7.25pt">
  <p class=MsoNormal><o:p>&nbsp;</o:p></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>
', 1)
SET IDENTITY_INSERT [dbo].[Email_Templates] OFF
GO
SET IDENTITY_INSERT [dbo].[Family_Member] ON 

INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (1, 6, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'Male', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (2, 6, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'Male', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (3, 6, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (4, 10, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'Male', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (5, 10, N'Andre', N'Desamito', N'Dela Cruz', N'', N'23', N'Male', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (6, 2, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'Male', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (7, 2, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'Male', 1)
INSERT [dbo].[Family_Member] ([id], [owner_id], [first_name], [last_name], [middle_name], [suffix_name], [age], [gender], [Status]) VALUES (8, 7, N'John Henrick', N'Abistado', N'Mosende', N'', N'23', N'Male', 1)
SET IDENTITY_INSERT [dbo].[Family_Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([id], [owner_id], [amount], [due_date], [payment_date], [receipt], [date_paid], [status]) VALUES (1, 2, 250, N'April 2024', N'January 2024', N'/Upload/Receipt/gdasdw.png', N'2024-05-08', 1)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([id], [owner_id], [name], [type], [breed], [gender], [is_vaccinated], [picture], [Status]) VALUES (1, 10, N'Kyubi', N'Dog', N'Aspin', N'Female', 1, N'/Upload/PetPicture/s31xea.png', 1)
INSERT [dbo].[Pets] ([id], [owner_id], [name], [type], [breed], [gender], [is_vaccinated], [picture], [Status]) VALUES (3, 10, N'Yukki', N'Dog', N'Aspin', N'Male', 1, N'/Upload/PetPicture/d3vd4x.png', 1)
INSERT [dbo].[Pets] ([id], [owner_id], [name], [type], [breed], [gender], [is_vaccinated], [picture], [Status]) VALUES (4, 2, N'Yukki', N'Dog', N'Aspin', N'Male', 1, N'/Upload/PetPicture/bwfgdl.png', 1)
INSERT [dbo].[Pets] ([id], [owner_id], [name], [type], [breed], [gender], [is_vaccinated], [picture], [Status]) VALUES (5, 2, N'Kyubi', N'Dog', N'Corgi', N'Female', 1, N'/Upload/PetPicture/lw0org.png', 1)
INSERT [dbo].[Pets] ([id], [owner_id], [name], [type], [breed], [gender], [is_vaccinated], [picture], [Status]) VALUES (6, 7, N'Yukki', N'Dog', N'Aspin', N'Male', 1, N'/Upload/PetPicture/m3qd2r.png', 1)
SET IDENTITY_INSERT [dbo].[Pets] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Profile] ON 

INSERT [dbo].[User_Profile] ([id], [account_id], [first_name], [last_name], [middle_name], [suffix], [email], [age], [gender], [phone_no], [status]) VALUES (2, 2, N'Nat', N'App', N'', N'', N'natania.app@outlook.com', N'23', N'Male', N'9984826461', 1)
INSERT [dbo].[User_Profile] ([id], [account_id], [first_name], [last_name], [middle_name], [suffix], [email], [age], [gender], [phone_no], [status]) VALUES (6, 7, N'John Henrick', N'Abistado', N'', N'', N'johnhenrickabistado12@gmail.com', N'24', N'Male', N'9984826461', 1)
INSERT [dbo].[User_Profile] ([id], [account_id], [first_name], [last_name], [middle_name], [suffix], [email], [age], [gender], [phone_no], [status]) VALUES (7, 8, N'test', N'test', N'', N'', N'phptest715@gmail.com', N'', N'', N'', 1)
SET IDENTITY_INSERT [dbo].[User_Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([id], [owner_id], [type], [brand], [model], [plate_no], [orcr], [status]) VALUES (1, 2, N'Motor', N'Honda', N'Click', N'ABC123', N'', 2)
INSERT [dbo].[Vehicles] ([id], [owner_id], [type], [brand], [model], [plate_no], [orcr], [status]) VALUES (2, 2, N'Motor', N'Honda', N'Click', N'ABC123', N'', 2)
INSERT [dbo].[Vehicles] ([id], [owner_id], [type], [brand], [model], [plate_no], [orcr], [status]) VALUES (3, 2, N'Car', N'Honda', N'Civic', N'ABC123', N'', 2)
INSERT [dbo].[Vehicles] ([id], [owner_id], [type], [brand], [model], [plate_no], [orcr], [status]) VALUES (4, 2, N'E-bike', N'NWOW', N'New', N'N/A', N'/Upload/ORCR/fkqjq3.png', 2)
INSERT [dbo].[Vehicles] ([id], [owner_id], [type], [brand], [model], [plate_no], [orcr], [status]) VALUES (5, 7, N'Motor', N'Honda', N'Click', N'ABC123', N'/Upload/ORCR/qdvsju.png', 2)
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
/****** Object:  StoredProcedure [dbo].[Add_account]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Add_account](@first_name VARCHAR(20),@last_name VARCHAR(20), @email VARCHAR(80),@password VARCHAR(20), @token VARCHAR(100))
AS BEGIN
	INSERT INTO Accounts VALUES(@email, @password, 0, @token, 1,0)
	DECLARE @db_id INT
	SELECT @db_id = acc_id FROM Accounts WHERE email = @email AND password = @password
	INSERT INTO User_Profile VALUES(@db_id, @first_name, @last_name,'','',@email,'','','', 1)
	INSERT INTO Address VALUES(@db_id,'','','','','','','','','')
	IF @db_id != 0
		BEGIN
			SELECT 'success' result
		END
	ELSE
		BEGIN
			SELECT 'false' result
		END
END
GO
/****** Object:  StoredProcedure [dbo].[add_family_member]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[add_family_member](@owner_id INT, @first_name VARCHAR(80), @last_name VARCHAR(20), @middle_name VARCHAR(20), @suffix_name VARCHAR(20), @age INT, @gender VARCHAR(30))
AS BEGIN
BEGIN TRY
INSERT INTO Family_Member VALUES(@owner_id, @first_name, @last_name, @middle_name, @suffix_name, @age, @gender, 1)
SELECT first_name FROM Family_Member WHERE owner_id=@owner_id
END TRY

BEGIN CATCH
SELECT ERROR_MESSAGE()
END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[add_payment]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[add_payment](@owner_id INT, @amount INT, @payment_date VARCHAR(50), @due_date VARCHAR(50))
AS BEGIN
	INSERT INTO Payments VALUES(@owner_id, @amount, @due_date, @payment_date, '', '', 0)
END
GO
/****** Object:  StoredProcedure [dbo].[add_pet]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[add_pet](@owner_id INT,@name VARCHAR(80), @type VARCHAR(40),@breed VARCHAR(80),@gender VARCHAR(20),@is_vaccinated INT)
AS BEGIN
DECLARE @db_row INT

SELECT @db_row = COUNT(id) FROM pets WHERE owner_id = @owner_id AND name = @name

IF @db_row != 0
	BEGIN
	SELECT 'error - pet already exist' result
	END
ELSE
	BEGIN
	INSERT INTO pets VALUES(@owner_id,@name,@type,@breed,@gender,@is_vaccinated,Null,1)
	SELECT @db_row = COUNT(id) FROM pets WHERE owner_id=@owner_id AND name = @name
	IF @db_row != 0
		BEGIN
		SELECT 'success' result, @name name
		END
	ELSE
		BEGIN
		SELECT 'error - failed adding pet' result
		END

	END
END
GO
/****** Object:  StoredProcedure [dbo].[admin_login]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[admin_login](
@email VARCHAR(50),
@password VARCHAR(50))

AS BEGIN
DECLARE @db_id INT
DECLARE @db_count INT
DECLARE @db_role INT
SELECT @db_count = COUNT (acc_id) FROM Accounts WHERE email=@email AND password=@password
SELECT @db_id = acc_id FROM Accounts WHERE email=@email AND password=@password
IF @db_count != 0
	BEGIN
		SELECT @db_role = role FROM Accounts WHERE acc_id=@db_id
		IF @db_role = 1
			BEGIN
				SELECT 'true' result
			END
		ELSE
			BEGIN
				SELECT 'false-not-admin' result
			END
	END
ELSE
	BEGIN
		SELECT 'false-invalid-credentials' result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[check_cpass_token]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[check_cpass_token](@email VARCHAR(80), @token VARCHAR(100))
AS BEGIN
	DECLARE @db_row INT
	SELECT @db_row = COUNT(acc_id) FROM Accounts WHERE email=@email AND token=@token
	IF @db_row != 0
	BEGIN
		SELECT 'true' result
	END
	ELSE
	BEGIN
		SELECT 'false' result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[check_email]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[check_email](@email VARCHAR(80))
AS BEGIN
DECLARE @count INT
SELECT @count = COUNT(email) FROM Accounts WHERE email=@email
IF @count != 0
	BEGIN
		SELECT 'true' result
	END
ELSE
	BEGIN
		SELECT 'false' result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[check_id]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[check_id](@id INT)
AS BEGIN
SELECT email FROM Accounts WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[check_token]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[check_token](@email VARCHAR(80))
AS BEGIN
DECLARE @db_token VARCHAR(100)
SELECT @db_token = token FROM Accounts WHERE email=@email
IF @db_token = ''
	BEGIN
		SELECT 'false' result
	END
ELSE
	BEGIN
		SELECT 'true' result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[compare_email]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[compare_email](@id INT, @email VARCHAR(80))
AS BEGIN
DECLARE @count INT
SELECT @count = COUNT (email) FROM Accounts WHERE email = @email AND acc_id = @id
IF @count != 0
BEGIN
	SELECT 'true' result
END

ELSE
BEGIN
	SELECT 'false' result
END
END
GO
/****** Object:  StoredProcedure [dbo].[display_dues]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[display_dues](@owner_id INT)
AS BEGIN
	SELECT  payment_date,amount,due_date FROM Payments WHERE owner_id = @owner_id AND status=0
END
GO
/****** Object:  StoredProcedure [dbo].[display_family_member]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[display_family_member](@owner_id INT)
AS BEGIN
SELECT first_name,last_name,suffix_name,age,gender FROM Family_Member WHERE status=1 AND owner_id=@owner_id
END
GO
/****** Object:  StoredProcedure [dbo].[display_payment_history]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[display_payment_history](@owner_id INT)
AS BEGIN
	SELECT  payment_date,amount,date_paid, receipt FROM Payments WHERE owner_id = @owner_id AND status=1
END
GO
/****** Object:  StoredProcedure [dbo].[display_pets]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[display_pets](@owner_id INT)
AS BEGIN
SELECT name,type,breed,gender,is_vaccinated,picture FROM Pets WHERE status=1 AND owner_id=@owner_id
END
GO
/****** Object:  StoredProcedure [dbo].[display_vehicle]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[display_vehicle](@owner_id INT)
AS BEGIN
SELECT type, brand, model, plate_no, orcr,status FROM Vehicles WHERE owner_id=@owner_id
END
GO
/****** Object:  StoredProcedure [dbo].[get_admin_details]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_admin_details]
AS BEGIN
	SELECT Accounts.acc_id, User_Profile.first_name, User_Profile.last_name, Address.phase, Address.lot, Address.block, Address.street
FROM     Accounts INNER JOIN
                  Address ON Accounts.acc_id = Address.account_id INNER JOIN
                  User_Profile ON Address.account_id = User_Profile.account_id
END
GO
/****** Object:  StoredProcedure [dbo].[get_details]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_details](@acc_id INT)
AS BEGIN
SELECT User_Profile.first_name, User_Profile.last_name, User_Profile.account_id, User_Profile.middle_name, User_Profile.suffix, User_Profile.email, User_Profile.age, User_Profile.gender, User_Profile.phone_no, Address.phase, Address.lot, 
                  Address.block, Address.street, Address.barangay, Address.city, Address.province, Address.country, Address.postal_code
FROM     User_Profile INNER JOIN
                  Accounts ON User_Profile.account_id = Accounts.acc_id INNER JOIN
                  Address ON User_Profile.account_id = Address.account_id
WHERE  (User_Profile.account_id = @acc_id)
END
GO
/****** Object:  StoredProcedure [dbo].[get_email_template]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_email_template](@template_name VARCHAR(80))
AS BEGIN
	SELECT template FROM Email_Templates WHERE name = @template_name
END
GO
/****** Object:  StoredProcedure [dbo].[get_firstname_by_email]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_firstname_by_email](@email VARCHAR(80))
AS BEGIN
	SELECT first_name FROM User_Profile WHERE email=@email
END
GO
/****** Object:  StoredProcedure [dbo].[get_homeowners_details]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_homeowners_details](@acc_id INT)
AS BEGIN
		SELECT User_Profile.first_name, User_Profile.last_name, User_Profile.middle_name, User_Profile.suffix, User_Profile.email, User_Profile.age, User_Profile.gender, User_Profile.phone_no, Address.phase, Address.lot, Address.block, 
                  Address.street, Address.barangay, Address.city, Address.province, Address.country, Address.postal_code
FROM     User_Profile INNER JOIN
                  Address ON User_Profile.account_id = Address.account_id
WHERE  (User_Profile.account_id = @acc_id)
END
GO
/****** Object:  StoredProcedure [dbo].[get_homeowners_family]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_homeowners_family](@acc_id INT)
AS BEGIN
	SELECT first_name, last_name, age, gender FROM Family_Member WHERE owner_id=@acc_id AND Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[get_homeowners_pets]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_homeowners_pets](@acc_id INT)
AS BEGIN
	SELECT name, type, breed, is_vaccinated FROM Pets WHERE owner_id=@acc_id AND Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[get_homeowners_vehicles]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[get_homeowners_vehicles](@acc_id INT)
AS BEGIN
	SELECT type, brand, model, plate_no, status FROM Vehicles WHERE owner_id=@acc_id AND status!=0
END
GO
/****** Object:  StoredProcedure [dbo].[is_verified]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[is_verified]
    @acc_id INT,
    @result INT OUTPUT
AS 
BEGIN
    SELECT @result = is_verified FROM Accounts WHERE acc_id = @acc_id
END
GO
/****** Object:  StoredProcedure [dbo].[register_vehicle]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[register_vehicle](@owner_id INT, @type VARCHAR(20), @brand VARCHAR(50), @model VARCHAR(50),@plate_number VARCHAR(50))
AS BEGIN
DECLARE @db_id INT
INSERT INTO Vehicles VALUES(@owner_id, @type, @brand, @model, @plate_number,'', 2)
SELECT @db_id = @@IDENTITY
SELECT 'true' result, @db_id v_id
END
GO
/****** Object:  StoredProcedure [dbo].[save_orcr]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[save_orcr](@owner_id INT, @v_id INT, @orcr VARCHAR(MAX))
AS BEGIN
UPDATE Vehicles SET orcr=@orcr WHERE owner_id=@owner_id AND id=@v_id
SELECT 'true' result
END
GO
/****** Object:  StoredProcedure [dbo].[save_pet_pic]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[save_pet_pic](@owner_id INT, @name VARCHAR(80), @imgpath VARCHAR(MAX))
AS BEGIN
UPDATE Pets SET picture=@imgpath WHERE owner_id=@owner_id AND name=@name
SELECT @imgpath imgpath
END
GO
/****** Object:  StoredProcedure [dbo].[sign_in]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sign_in](@email VARCHAR(80), @password VARCHAR(20))
AS BEGIN
DECLARE @db_id_count INT
DECLARE @db_id INT
DECLARE @result INT
SELECT @db_id_count = COUNT (acc_id) from Accounts WHERE email=@email AND password = @password
IF @db_id_count != 0
BEGIN
	SELECT @db_id = acc_id from Accounts WHERE email=@email AND password = @password
        EXEC is_verified @db_id, @result OUTPUT
        IF @result = 1
		BEGIN
			SELECT 'success' result, @db_id id
		END
		ELSE
		BEGIN
			SELECT 'error-not-verified' result
		END
END
ELSE
BEGIN
SELECT 'error-invalid-credentials' result
END
END
GO
/****** Object:  StoredProcedure [dbo].[update_address]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[update_address](
@acc_id INT,
@phase VARCHAR(2),
@lot VARCHAR(20),
@block VARCHAR(20),
@street VARCHAR(50),
@barangay VARCHAR(50),
@city VARCHAR(50),
@province VARCHAR(50),
@country VARCHAR(50),
@postal_code VARCHAR(20))

AS BEGIN
	DECLARE @query VARCHAR(MAX)
	UPDATE Address SET phase=@phase, lot=@lot, block=@block, street=@street, barangay=@barangay, city=@city, 
	province=@province, country=@country, postal_code=@postal_code WHERE account_id=@acc_id

	SELECT 'true' result

END
GO
/****** Object:  StoredProcedure [dbo].[update_details]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[update_details](

@account_id INT,
@first_name VARCHAR(80),
@last_name VARCHAR(40), 
@middle_name VARCHAR(40), 
@suffix_name VARCHAR(20), 
@email VARCHAR(80), 
@age VARCHAR(20), 
@gender VARCHAR(30),
@phone_no VARCHAR(15))

AS BEGIN
UPDATE User_Profile SET 
first_name = @first_name, 
last_name = @last_name, 
middle_name = @middle_name, 
suffix = @suffix_name, 
email = @email, 
age = @age, 
gender = @gender, 
phone_no = @phone_no

WHERE account_id = @account_id
DECLARE @count INT
SELECT @count = COUNT (account_id) FROM User_Profile WHERE account_id=@account_id
IF @count != 0
	BEGIN
		SELECT 'success' result
	END
ELSE
	BEGIN
		SELECT 'false' result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[update_password]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[update_password](@email VARCHAR(80), @password VARCHAR(20))
AS BEGIN
UPDATE Accounts SET password=@password, token='' WHERE email=@email
DECLARE @db_row INT
SELECT @db_row = COUNT(acc_id) FROM Accounts WHERE password=@password AND email=@email
IF @db_row = 1
BEGIN
	SELECT 'true' result
END
ELSE
BEGIN
	SELECT 'false' result
END
END
GO
/****** Object:  StoredProcedure [dbo].[update_payment]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[update_payment](@payment_id INT,@owner_id INT, @receipt VARCHAR(MAX))
AS BEGIN
	DECLARE @date_now VARCHAR(50)
	SELECT @date_now = CAST( GETDATE() AS Date )
	UPDATE Payments SET receipt=@receipt,date_paid=@date_now,status=1 WHERE owner_id=@owner_id AND id=@payment_id
END
GO
/****** Object:  StoredProcedure [dbo].[update_token]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[update_token](@email VARCHAR(80), @token VARCHAR(100))
AS BEGIN
	UPDATE Accounts SET token = @token WHERE email=@email
	DECLARE @db_token VARCHAR(100)
	SELECT @db_token = token FROM Accounts WHERE email=@email
	IF @db_token != ''
	BEGIN
		SELECT 'true' result
	END
	ELSE
	BEGIN
		SELECT 'false' result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[verify_email]    Script Date: 16/05/2024 2:34:47 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[verify_email](@email VARCHAR(80), @token VARCHAR(100))
AS BEGIN
DECLARE @db_token VARCHAR(80)
SELECT @db_token = token FROM Accounts WHERE email=@email
IF @db_token = @token
BEGIN
UPDATE Accounts SET is_verified = 1, token = ''
WHERE email = @email
SELECT 'true' title
END
ELSE
BEGIN
SELECT 'false' title
END
END
GO
USE [master]
GO
ALTER DATABASE [NATANIA] SET  READ_WRITE 
GO
