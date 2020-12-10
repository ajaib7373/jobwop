-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2018 at 06:40 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobfair`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `job_count`) VALUES
(1, 'Accounting/Finance', 'accountingfinance', 0),
(2, 'Bank/ Non-Bank Fin. Institution', 'bank-non-bank-fin-institution', 0),
(3, 'Commercial/Supply Chain', 'commercialsupply-chain', 3),
(4, 'Education/Training', 'educationtraining', 0),
(5, 'Engineer/Architects', 'engineerarchitects', 0),
(6, 'Garments/Textile', 'garmentstextile', 0),
(7, 'HR/Org. Development', 'hrorg-development', 0),
(9, 'Gen Mgt/Admin', 'gen-mgtadmin', 0),
(10, 'Design/Creative', 'designcreative', 0),
(11, 'Production/Operation', 'productionoperation', 0),
(12, 'Hospitality/ Travel/ Tourism', 'hospitality-travel-tourism', 0),
(13, 'Beauty Care/ Health & Fitness', 'beauty-care-health-fitness', 0),
(14, 'Electrician/ Construction/ Repair', 'electrician-construction-repair', 2),
(15, 'IT & Telecommunication', 'it-telecommunication', 7),
(16, 'Marketing/Sales', 'marketingsales', 0),
(17, 'Customer Support/Call Centre', 'customer-supportcall-centre', 0),
(18, 'Media/Ad./Event Mgt.', 'mediaadevent-mgt', 0),
(19, 'Medical/Pharma', 'medicalpharma', 0),
(20, 'Agro (Plant/Animal/Fisheries)', 'agro-plantanimalfisheries', 0),
(21, 'NGO/Development', 'ngodevelopment', 0),
(22, 'Research/Consultancy', 'researchconsultancy', 0),
(23, 'Secretary/Receptionist', 'secretaryreceptionist', 0),
(24, 'Data Entry/Operator/BPO', 'data-entryoperatorbpo', 0),
(25, 'Driving/Motor Technician', 'drivingmotor-technician', 0),
(26, 'Security/Support Service', 'securitysupport-service', 0),
(27, 'Law/Legal', 'lawlegal', 0),
(28, 'Others', 'others', 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES

(69, 'ET', 'Ethiopia');

-- --------------------------------------------------------

--
-- Table structure for table `flag_jobs`
--

DROP TABLE IF EXISTS `flag_jobs`;
CREATE TABLE `flag_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flag_jobs`
--

INSERT INTO `flag_jobs` (`id`, `job_id`, `reason`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'applying_problem', 'grinder_gurred@gmail.com', 'Hello Wisteen,\r\nPlease check this job post, it\'s has a problem.', 
'2018-11-28 11:54:30', '2018-11-28 11:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `job_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_any_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` int(11) DEFAULT '0',
  `salary_upto` int(11) DEFAULT '0',
  `is_negotiable` tinyint(4) DEFAULT '0',
  `salary_cycle` enum('monthly','yearly','weekly','daily','hourly') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vacancy` int(11) DEFAULT NULL,
  `gender` enum('male','female','transgender','any') COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` enum('full_time','part_time','contract','temporary','commission','internship') COLLATE utf8mb4_unicode_ci DEFAULT 'full_time',
  `exp_level` enum('mid','entry','senior') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `responsibilities` text COLLATE utf8mb4_unicode_ci,
  `educational_requirements` text COLLATE utf8mb4_unicode_ci,
  `experience_requirements` text COLLATE utf8mb4_unicode_ci,
  `additional_requirements` text COLLATE utf8mb4_unicode_ci,
  `benefits` text COLLATE utf8mb4_unicode_ci,
  `apply_instruction` text COLLATE utf8mb4_unicode_ci,
  `country_id` int(11) DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_required_years` tinyint(4) DEFAULT '0',
  `experience_plus` tinyint(4) DEFAULT '0',
  `views` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `job_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_premium` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `user_id`, `job_title`, `job_slug`, `position`, `category_id`, `is_any_where`, `salary`, `salary_upto`, 
`is_negotiable`, `salary_cycle`, `salary_currency`, `vacancy`, `gender`, `job_type`, `exp_level`, `description`, `skills`, 
`responsibilities`, `educational_requirements`, `experience_requirements`, `additional_requirements`, `benefits`, `apply_instruction`,
 `country_id`, `country_name`, `state_id`, `state_name`, `city_name`, `experience_required_years`, `experience_plus`, `views`,
  `approved_at`, `deadline`, `status`, `job_id`, `is_premium`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fullstack PHP Developer', 'fullstack-php-developer', 'Senior PHP Developer', 15, NULL, 4000, NULL, NULL, 'monthly', 'USD', 12,
 'any', 'full_time', 'mid', 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially
  unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently
   with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of 
   the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,
    when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only 
    five centuries, but also the leap into electronic typesetting', 'PHP, MySQL, Laravel, Codeigniter, Zend Framework, 
    HTML, CSS', 'Ability to solve problems as they appear in projects and help project team members as necessary.\r\nAbility to meet 
    tight deadlines and doesn\'t take working as pressure but enjoys challenges.\r\nMust have very good knowledge Javascript
     Framework/Library.\r\nMinimum 2 years of working experience in Raw PHP, Codeigniter / Laravel Framework (mandatory).\r\nBasic 
     knowledge of various Web API\'s and how to integrate with 3rd party systems', 'B.Sc/ M.Sc in Computer Science/ Engineering 
     from any reputed university', 'Min 3 years experience required', 'Ability to work under pressure and meet the 
     deadline\r\nAbility to work individually and independently with minimal supervision\r\nApplicant must be polite, 
     gentle, have also good behavior, good mentality & also have a good character.', 'Yearly Vacation\r\nUnlimited Drinks
      and coffee\r\n15 days paid leave\r\nVisa Sponsor / Relocation', 'Apply online, we will contact with you', 231, 'United States',
       3956, 'New York', 'Brooklyn', 4, NULL, NULL, NULL, '2023-03-15 00:00:00', 1, '1JRJKEMX', 1, '2018-11-24 15:27:46', 
       '2018-11-29 11:59:46'),
(12, 3, 'Display Supplier', 'display-supplier', 'Supply Chain & Operations Management', 3, NULL, 28000, NULL, NULL, 'yearly', 'USD', 6, 'male', 'full_time', 'senior', 'On the off chance that you adore the quest for greatness and are propelled by the difficulties that come through driving developments that affect how the world lives, functions and plays, at that point we welcome you to take in more about Microsoft Gadgets Inventory network (DSC) and the esteem we convey crosswise over Microsoft and to our clients and accomplices. We offer one of a kind chances to take a shot at high-affect extends in a domain that acknowledges decent variety, centers around ability advancement, and perceives outstanding commitment.', 'MS Office, Windows 10, E-Mail Writing, professional writing, Lazy', '8+ years of experience in Supply Chain, Finance, Procurement or Manufacturing Operations\r\nBachelor’s degree in Supply Chain, Operations Management, Engineering or related field\r\nStrong analytical and data orientation skills', 'Minimum Bachelor Degree\r\nCertification of MS Office', 'Experience with MRP systems, preferably SAP\r\nComfortable working in a fast-paced, high-growth, ambiguous environment\r\nContinued education accreditations, such as APICS, ASQ Lean Six Sigma certified', 'roven track record of delivering change and decision making with cross-functional stakeholders\r\nStrong process & tool (ERP, MS Office, Power BI, etc) background and proven capability to rapidly understand, use and drive improvements\r\nExperience with MRP systems, preferably SAP', 'Industry leading healthcare \r\nSavings and investments \r\nGiving programs \r\nEducational resources \r\nMaternity and paternity leave \r\nOpportunities to network and connect \r\nDiscounts on products and services \r\nGenerous time away', 'send your resume to touch@demo.com', 231, 'United States', 3975, 'Washington', 'Redmond', 8, 1, NULL, NULL, '2025-11-20 00:00:00', 1, '4Z1XIDUMO', NULL, '2018-12-01 15:43:53', '2018-12-01 15:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

DROP TABLE IF EXISTS `job_applications`;
CREATE TABLE `job_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_shortlisted` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `employer_id`, `user_id`, `name`, `email`, `phone_number`, `message`, `resume`, `is_shortlisted`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Jhony Deep', 'jhony@demo.com', '112234354', 'Please check my resume', '1543343268ixhnt-test-resume-file.docx', NULL, '2018-11-27 12:27:48', '2018-11-27 12:27:48'),
(2, 1, 1, 0, 'John Cina', 'johncina@demo.com', '123234345', 'Hello Sir, I am ready to join any time, please check my CV', '15435179226vl8f-test-resume-file.docx', 1, '2018-11-29 12:58:42', '2018-11-29 13:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_08_01_155642_create_options_table', 1),
(4, '2018_11_02_203730_create_countries_table', 1),
(5, '2018_11_02_204731_create_states_table', 1),
(17, '2016_07_17_130657_create_categories_table', 2),
(18, '2018_11_23_210745_create_jobs_table', 2),
(19, '2018_11_27_181302_create_job_application_table', 3),
(20, '2018_11_28_174724_create_flag_job_table', 4),
(21, '2018_12_01_172656_create_user_following_employer_table', 5),
(22, '2018_12_04_181750_create_posts_table', 6),
(24, '2018_12_08_151357_create_pricing_table', 7),
(28, '2018_12_08_151370_create_payments_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_key`, `option_value`) VALUES
(2, 'enable_paypal', '1'),
(3, 'enable_stripe', '1'),
(4, 'stripe_test_mode', '1'),
(5, 'stripe_test_secret_key', 'sk_test_tJeAdA1KbhiYV1111118I8bfPmJcOL'),
(6, 'stripe_test_publishable_key', 'pk_test_P3TFmKrvT7l29Z333333333333pyy1f4pwk8'),
(7, 'stripe_live_secret_key', ''),
(8, 'stripe_live_publishable_key', ''),
(9, 'date_format', 'F j, Y'),
(10, 'default_timezone', 'Asia/Dhaka'),
(11, 'date_format_custom', 'd/m/Y'),
(12, 'site_title', 'Ethiopika'),
(13, 'email_address', 'admin@demo.com'),
(14, 'time_format', 'g:i A'),
(15, 'time_format_custom', 'g:i A'),
(17, 'number_of_premium_ads_in_home', '8'),
(18, 'number_of_free_ads_in_home', '8'),
(19, 'ads_per_page', '12'),
(20, 'regular_ads_price', '3'),
(21, 'premium_ads_price', '8'),
(24, 'paypal_receiver_email', 'shohelmail71-facilitator@gmail.com'),
(25, 'enable_paypal_sandbox', '1'),
(26, 'site_name', 'Ethiopika'),
(27, 'default_storage', 'public'),
(32, 'enable_facebook_login', '1'),
(33, 'enable_google_login', '1'),
(34, 'fb_app_id', '807346162a66754117'),
(35, 'fb_app_secret', '6b93030d55555c4f2715aa9d02be93256fbd'),
(36, 'google_client_id', ''),
(37, 'google_client_secret', ''),
(38, 'enable_social_login', '1'),
(39, 'enable_social_sharing_in_ad_box', '1'),
(40, 'order_by_premium_ads_in_listing', 'random'),
(41, 'number_of_premium_ads_in_listing', '3'),
(42, 'number_of_last_days_premium_ads', '30'),
(43, 'enable_slider', '1'),
(44, 'premium_ads_max_impressions', '50'),
(45, 'copyright_text', 'Copyright [copyright_sign] [year] [site_name], all rights reserved'),
(58, 'site_email_address', 'info@customer.com '),
(86, 'currency_sign', 'USD'),
(93, 'meta_description', 'meta_description'),
(96, 'category_count_cached', '1544462424'),
(97, 'currency_position', 'left'),
(98, 'enable_bank_transfer', '1');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `premium_job` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('initial','pending','success','failed','declined','dispute') COLLATE utf8mb4_unicode_ci DEFAULT 'initial',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id_or_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_created` int(11) DEFAULT NULL,
  `bank_swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `name`, `email`, `package_name`, `package_id`, `premium_job`, `amount`, `payment_method`, `status`, `currency`, `token_id`, `card_last4`, `card_id`, `card_brand`, `card_country`, `card_exp_month`, `card_exp_year`, `client_ip`, `charge_id_or_token`, `payer_email`, `description`, `local_transaction_id`, `payment_created`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `created_at`, `updated_at`) VALUES
(1, 1, 'John Doe', 'admin@demo.com', 'Professional', 1, 3, '30.00', 'paypal', 'success', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRAN_1544294097QW0Q2H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-08 12:34:57', '2018-12-08 12:34:57'),
(7, 2, 'Stephen King', 'stephen@demo.com', 'Professional', 1, 3, '30.00', 'stripe', 'success', 'USD', NULL, '4242', 'card_1DfXXPIdV7MTb07G3VqLFVJ4', 'Visa', NULL, '12', '2019', NULL, NULL, NULL, NULL, 'TRAN_1544382194PUI6F3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-09 13:03:14', '2018-12-09 13:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci,
  `feature_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('post','page') COLLATE utf8mb4_unicode_ci DEFAULT 'post',
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `show_in_header_menu` tinyint(4) DEFAULT NULL,
  `show_in_footer_menu` tinyint(4) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `post_content`, `feature_image`, `type`, `status`, `show_in_header_menu`, `show_in_footer_menu`, `views`, `created_at`, `updated_at`) VALUES
(1, 1, 'About Us', 'about-us', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Updated</p>', NULL, 'page', '1', 1, 0, 9, '2018-12-04 13:28:46', '2018-12-10 11:36:18'),
(2, 1, 'Terms and Conditions', 'terms-and-conditions', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, 'page', '1', 0, 1, 1, '2018-12-04 13:29:35', '2018-12-07 14:19:03'),
(5, 1, 'JobFair is the best job board application', 'jobfair-is-the-best-job-board-application', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '15440387382qhmh-animal-2.jpeg', 'post', '1', NULL, NULL, 4, '2018-12-05 13:38:57', '2018-12-09 14:01:56'),
(6, 1, 'Job Seeker can track their application through dashboard', 'job-seeker-can-track-their-application-through-dashboard', '<p>Lorem ipsum dolor sit amet, nibh propriae imperdiet ea vis, pro in epicuri appareat antiopam, odio vidit movet in nec. Quo diam noluisse adipisci ea, verear reprimique est an, ad perfecto accommodare duo. Mea ex aliquam facilisis, duo euismod sanctus ea. Solum causae utroque his ne. Legere euismod te usu, falli suscipit cu nam. Nam fugit graece maluisset id, duo an alia mediocrem, ea consul vidisse recusabo nam.</p>\r\n\r\n<p>Ludus saepe appetere vix ea, quaestio evertitur posidonium per no. At aliquip adipisci erroribus qui, pro novum possit repudiandae ea. Cum at natum soluta senserit, cetero posidonium nam ne. Ne fugit minimum reformidans nec. Eirmod qualisque adolescens id sed. Vim et singulis electram, an usu quod clita deserunt.</p>\r\n\r\n<p>No ius reque ullamcorper. Nonumes noluisse neglegentur id eum, nec minim congue timeam id, agam corpora ex duo. Vim ne sumo case exerci, et eos luptatum similique. Modus tation democritum qui in, posse iisque labitur per ne, numquam nostrum et mei. Has facer malorum in. Nec quis nulla recteque te, case invidunt mel no.</p>\r\n\r\n<p>Malis altera ad mel, eos cu commodo bonorum. Sea ei ferri epicurei, quod noster instructior in ius, malorum adipiscing no eam. Sea solum detraxit id. Eu est mandamus electram, vix eu definiebas argumentum, mea id summo singulis. Erant postulant mel cu. Paulo populo ea mea.</p>\r\n\r\n<p>Et luptatum democritum efficiendi sit, vim et sint maiorum, eam cu iuvaret tibique. His at augue dolores, ad mea tempor repudiare, quidam phaedrum ne has. Ius mentitum nominavi scaevola at. Unum tamquam evertitur ea vix. An veritus persequeris conclusionemque qui.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, nibh propriae imperdiet ea vis, pro in epicuri appareat antiopam, odio vidit movet in nec. Quo diam noluisse adipisci ea, verear reprimique est an, ad perfecto accommodare duo. Mea ex aliquam facilisis, duo euismod sanctus ea. Solum causae utroque his ne. Legere euismod te usu, falli suscipit cu nam. Nam fugit graece maluisset id, duo an alia mediocrem, ea consul vidisse recusabo nam.</p>\r\n\r\n<p>Ludus saepe appetere vix ea, quaestio evertitur posidonium per no. At aliquip adipisci erroribus qui, pro novum possit repudiandae ea. Cum at natum soluta senserit, cetero posidonium nam ne. Ne fugit minimum reformidans nec. Eirmod qualisque adolescens id sed. Vim et singulis electram, an usu quod clita deserunt.</p>\r\n\r\n<p>No ius reque ullamcorper. Nonumes noluisse neglegentur id eum, nec minim congue timeam id, agam corpora ex duo. Vim ne sumo case exerci, et eos luptatum similique. Modus tation democritum qui in, posse iisque labitur per ne, numquam nostrum et mei. Has facer malorum in. Nec quis nulla recteque te, case invidunt mel no.</p>\r\n\r\n<p>Malis altera ad mel, eos cu commodo bonorum. Sea ei ferri epicurei, quod noster instructior in ius, malorum adipiscing no eam. Sea solum detraxit id. Eu est mandamus electram, vix eu definiebas argumentum, mea id summo singulis. Erant postulant mel cu. Paulo populo ea mea.</p>\r\n\r\n<p>Et luptatum democritum efficiendi sit, vim et sint maiorum, eam cu iuvaret tibique. His at augue dolores, ad mea tempor repudiare, quidam phaedrum ne has. Ius mentitum nominavi scaevola at. Unum tamquam evertitur ea vix. An veritus persequeris conclusionemque qui.</p>', '1544040390mmrbl-business-869379-1280.jpg', 'post', '1', NULL, NULL, 15, '2018-12-05 14:06:29', '2018-12-06 13:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

DROP TABLE IF EXISTS `pricings`;
CREATE TABLE `pricings` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL,
  `premium_job` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `package_name`, `price`, `premium_job`, `status`) VALUES
(1, 'Professional', '30.00', 3, 0),
(2, 'Enterprise', '80.00', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `state_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_name`, `country_id`) VALUES

(8, 'Oromia', 69);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('user','employer','agent','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_size` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_company` text COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premium_jobs_balance` int(11) DEFAULT '0',
  `active_status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `country_id`, `country_name`, `state_id`, `state_name`, `city`, `gender`, `address`, `address_2`, `website`, `phone`, `photo`, `user_type`, `company`, `company_slug`, `company_size`, `about_company`, `logo`, `premium_jobs_balance`, `active_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'admin@demo.com', NULL, '$2y$10$uk0pVAxEhUelFpOCky4O9.I4yWGRbfTx3kPcbNJHp2NEiBHGLtTni', 231, 'United States', 3922, 'Arkansas', 'Bentonville', 'male', '702 SW 8th St, Bentonville, AR 72716, USA', NULL, 'https://www.walmart.com/', '+1 479-273-4000', NULL, 'admin', 'Walmart', 'walmart', 'H', 'Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,', '1544382937dnupc-walmart.jpg', 16, 1, 'zY6jNOK4RTvTpq9Nd9E1FRVyC2h5xPI5LlIEpkRn7pHXEbhAisTJ6a4VENkI', '2018-12-08 15:33:31', '2018-12-09 13:15:37'),
(2, 'Stephen King', 'stephen@demo.com', NULL, '$2y$10$KrY1rroERNyM7jN/t7XH4O1Wa2scYc6eIYDgYfskn.ABc3nJfyr.C', 231, 'United States', 3924, 'California', 'Mountain View', NULL, '1600 Amphitheatre Pkwy', NULL, NULL, '1223424345', NULL, 'employer', 'Google', 'google', 'A', NULL, '15443818091odcq-google.png', 2, 1, 'aBB69jjikN2rUtvOq64NGGaSTxP9pnvEx4MT8Zx726J9hpQgRZO8WKz3lB67', '2018-11-23 14:01:11', '2018-12-09 13:03:58'),
(3, 'Arnold Craig', 'arnold@demo.com', NULL, '$2y$10$ede.pJvkTipdh/yUE/UAL.qmMSM5.UXAKlUp7XydNDN3MsdEzOKM.', 231, 'United States', 3975, 'Washington', 'Redmond', NULL, 'One Microsoft Way', NULL, 'https://microsoft.com', '12323435', NULL, 'employer', 'Microsoft', 'microsoft', 'F', NULL, '1543703058nsvoo-microsoft.png', 0, 1, 'XzMR8xdazUmJTc3JU7WvjqLE7bcOBwKbGAPgWMbpCsmFkvzpN9Y6gyahLSYt', '2018-11-23 14:04:49', '2018-12-01 16:24:18'),
(4, 'Brenda S. Dowd', 'brenda@demo.com', NULL, '$2y$10$MFzJkOO4evhEtAIIrra05.Fmpe3zMUSRGJ0ssv52faqhhV.C5DAMu', 105, NULL, 1761, NULL, 'Dublin', NULL, '57 Tringle Drive', NULL, NULL, '305-835-0342', NULL, 'agent', 'twelveColor', 'twelvecolor', NULL, NULL, NULL, 0, 1, NULL, '2018-11-23 14:14:06', '2018-11-23 14:14:06'),
(5, 'Eric C. Hyde', 'eric@demo.com', NULL, '$2y$10$PURWQtCW6rJLCb6BK3RbHeTfdkbAdXCO3VgrvoNnoTifi65PovJDi', 82, NULL, 1364, NULL, 'Barmbek-Süd', NULL, '269 Camden Street', 'Topaz Lake', NULL, '775-266-2166', NULL, 'agent', 'TriangleDream', 'triangledream', NULL, NULL, NULL, 2, 1, '83dAyemQayRGKB3WhaURzbNDZufE7tNLwWV4JtBO7UzPNsfwjFeabCYGiUPp', '2018-11-23 14:17:14', '2018-12-09 12:18:24'),
(6, 'De Stephano', 'stephano@demo.com', NULL, '$2y$10$E7NWtyZiGVakfO6752IMVe59BT/XKAtRRswIYKo6Fz40eH9h9FDYW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 0, 1, 'jzXi4jaHqn7QfYcf4Q5V7D4FYfluOrMq6Ls1qloFgoeZv2aYZ035ViTUqMaV', '2018-11-25 06:17:45', '2018-11-25 06:17:45'),
(7, 'Apple', 'apple@demo.com', NULL, '$2y$10$C3UPhxwknyadz6bm8.SXk.gUAX1LWjCwdYuTcSc/kDbbyuuMrJIkS', 231, 'United States', 3924, 'California', 'Cupertino', NULL, 'One Apple Park Way', NULL, 'https://apple.com', '12334324545', NULL, 'employer', 'Apple', 'apple', 'A', NULL, '1543704173se5dg-apple.png', 0, 1, NULL, '2018-12-01 16:41:33', '2018-12-09 09:00:49'),
(8, 'Ajaib', 'Ajaib@demo.com', NULL, '$2y$10$33TUsE5vEafW6qRu2nmua.x5StqyAjmIsAqlqp3MkQh6ciZTRif7u⏎', 69, 'Ethiopia', 8, 'Oromia', 'Addis Ababa', NULL, 'Addis Ababa Near shewa super market', NULL, 'https://dron.com', '09894545', NULL, 'admin', 'Ethiopika', 'ethiopika', 'A', NULL, '1543704173se5dg-apple.png', 0, 1, NULL, '2020-11-01 16:41:33', '2020-11-09 09:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_following_employers`
--

DROP TABLE IF EXISTS `user_following_employers`;
CREATE TABLE `user_following_employers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_following_employers`
--

INSERT INTO `user_following_employers` (`id`, `user_id`, `employer_id`, `created_at`, `updated_at`) VALUES
(3, 6, 1, '2018-12-01 12:07:05', '2018-12-01 12:07:05'),
(4, 8, 1, '2020-11-01 16:41:33', '2020-11-09 09:00:49')
;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flag_jobs`
--
ALTER TABLE `flag_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_following_employers`
--
ALTER TABLE `user_following_employers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `flag_jobs`
--
ALTER TABLE `flag_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4121;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_following_employers`
--
ALTER TABLE `user_following_employers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
