-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Nov 2024 pada 12.48
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_products`
--

CREATE TABLE `image_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'et in'),
(2, 'reprehenderit esse'),
(3, 'reiciendis totam'),
(4, 'sit modi'),
(5, 'esse vero'),
(6, 'dolores qui'),
(7, 'iusto necessitatibus'),
(8, 'inventore placeat'),
(9, 'laboriosam aut'),
(10, 'quia et'),
(11, 'nesciunt molestiae'),
(12, 'ut dolores'),
(13, 'inventore nulla'),
(14, 'odit voluptate'),
(15, 'nihil doloribus'),
(16, 'odit id'),
(17, 'quam illo'),
(18, 'quia provident'),
(19, 'doloremque consequuntur'),
(20, 'sed consequuntur'),
(21, 'magnam voluptatem'),
(22, 'qui expedita'),
(23, 'rerum eaque'),
(24, 'quo autem'),
(25, 'nulla at'),
(26, 'ipsum dolorem'),
(27, 'sed perspiciatis'),
(28, 'dicta molestias'),
(29, 'provident commodi'),
(30, 'enim vel'),
(31, 'unde id'),
(32, 'fugit magnam'),
(33, 'magnam id'),
(34, 'qui repudiandae'),
(35, 'iure illum'),
(36, 'debitis accusamus'),
(37, 'quia ad'),
(38, 'qui repudiandae'),
(39, 'non hic'),
(40, 'placeat corporis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_23_081804_create_kategori_table', 1),
(6, '2024_11_26_122315_create_products_table', 1),
(7, '2024_11_27_080310_create_image_products_table', 1),
(8, '2024_11_28_101741_create_suppliers_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `weight` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `supplier_id`, `category_id`, `user_id`, `status`, `name`, `details`, `price`, `stock`, `weight`, `image`, `created_at`, `updated_at`) VALUES
(1, 32, 36, 89, 1, 'sapiente sit ut', 'Labore praesentium voluptas laborum qui nesciunt vero qui. Ipsa est et debitis qui adipisci ea rerum. Ut aut illo sint officiis ut recusandae et.', 624.47, 44, 1.15, 'https://via.placeholder.com/640x480.png/001177?text=products+Faker+animi', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(2, 7, 31, 36, 1, 'officia quia officiis', 'Neque accusamus quae eos aut autem qui. In repellendus illo quasi. Porro qui est et dolorem eum soluta sunt. Commodi amet fugit illum molestiae.', 655.37, 94, 3.29, 'https://via.placeholder.com/640x480.png/003311?text=products+Faker+a', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(3, 20, 22, 3, 1, 'impedit eaque laboriosam', 'Deleniti ut sed facilis. Exercitationem magnam maiores consequatur quod nemo mollitia reiciendis. Omnis molestiae beatae possimus.', 521.68, 72, 4.90, 'https://via.placeholder.com/640x480.png/0088ee?text=products+Faker+enim', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(4, 26, 21, 67, 1, 'porro exercitationem magnam', 'Ipsum asperiores inventore quidem velit quia. Ut excepturi impedit fuga quia aliquam.', 607.77, 86, 7.57, 'https://via.placeholder.com/640x480.png/0088ff?text=products+Faker+qui', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(5, 15, 1, 31, 1, 'et mollitia inventore', 'Non culpa dolor rerum laboriosam. Voluptatem molestiae enim asperiores quibusdam. Ducimus id eos eligendi sint quae.', 979.1, 67, 5.84, 'https://via.placeholder.com/640x480.png/00ee44?text=products+Faker+et', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(6, 28, 34, 83, 1, 'occaecati laudantium non', 'Sit odio quidem eligendi culpa voluptatem ut provident. Tempora sequi unde aut sequi. Iste qui architecto excepturi. Natus alias voluptatum rerum est.', 717.92, 30, 7.56, 'https://via.placeholder.com/640x480.png/004411?text=products+Faker+deleniti', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(7, 20, 20, 24, 0, 'optio rerum excepturi', 'Sit suscipit ut minima aspernatur ad et nesciunt. Dolor illum et est voluptatem eius. Ut illum qui quisquam dolorem non. Odit est sint aut exercitationem cupiditate molestiae rerum natus.', 744.42, 64, 9.28, 'https://via.placeholder.com/640x480.png/006600?text=products+Faker+voluptatibus', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(8, 21, 40, 39, 1, 'sed voluptatem optio', 'Qui explicabo ad alias et soluta. Mollitia ut ut veritatis est sed. Aspernatur nostrum qui provident voluptas.', 282.63, 38, 9.71, 'https://via.placeholder.com/640x480.png/00bbdd?text=products+Faker+quasi', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(9, 2, 36, 90, 1, 'est ipsum repudiandae', 'Suscipit voluptas pariatur exercitationem et. Dolorem harum qui dolorem nulla possimus iste praesentium. Aut aperiam tempore vitae et. Quis ad sint vitae odit officiis accusamus minus eum.', 323.86, 67, 1.86, 'https://via.placeholder.com/640x480.png/0055ee?text=products+Faker+veniam', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(10, 21, 17, 95, 0, 'voluptas aut quidem', 'Ad blanditiis mollitia ullam et odit dolor. Magnam aspernatur molestias modi officia. Velit quidem ullam molestiae architecto aperiam voluptas optio. Fuga officia aut voluptas fuga dignissimos voluptas qui.', 961.92, 39, 2.68, 'https://via.placeholder.com/640x480.png/004433?text=products+Faker+distinctio', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(11, 6, 18, 81, 0, 'quis dolorem dolor', 'Et quia molestiae voluptatem id. Dolore est laboriosam voluptas rerum rerum. Quia itaque doloribus quisquam quo placeat. Rem et id non sed minus porro quibusdam.', 681.82, 0, 2.84, 'https://via.placeholder.com/640x480.png/0055bb?text=products+Faker+quae', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(12, 28, 10, 87, 1, 'aperiam illum eaque', 'Eligendi voluptatem asperiores enim enim rerum quod ut. Sit non minima odio dicta rem. Quaerat ad sunt dolorem cum et.', 308.09, 66, 3.23, 'https://via.placeholder.com/640x480.png/00bbbb?text=products+Faker+quae', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(13, 8, 26, 88, 0, 'voluptatem tempora ut', 'Non est ut sunt non magni delectus soluta. Odio ipsam est itaque adipisci. Quidem autem repellat voluptas maxime. Perspiciatis totam et aperiam tenetur ducimus illum.', 985.29, 12, 4.13, 'https://via.placeholder.com/640x480.png/00ffdd?text=products+Faker+veritatis', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(14, 39, 3, 82, 0, 'perferendis voluptas corporis', 'Autem aut vero consectetur dolores. Alias voluptatem ad et autem occaecati vel qui. Earum atque et aut ratione cumque.', 393.97, 29, 3.24, 'https://via.placeholder.com/640x480.png/000033?text=products+Faker+sed', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(15, 14, 20, 36, 1, 'earum et nam', 'Sed natus quis voluptatem libero id deleniti non. Ad doloribus voluptatem quia impedit accusamus molestias. Magni omnis ad doloremque voluptas.', 466.67, 67, 4.20, 'https://via.placeholder.com/640x480.png/008833?text=products+Faker+dolor', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(16, 25, 28, 2, 1, 'eum voluptate repellat', 'Voluptas dolores sunt distinctio temporibus eum facilis veritatis. Molestiae voluptas et alias perferendis nulla qui. Tempora officia iste repudiandae quisquam eius error.', 600.46, 97, 7.78, 'https://via.placeholder.com/640x480.png/00ee99?text=products+Faker+modi', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(17, 15, 5, 30, 0, 'esse voluptate error', 'Molestiae laboriosam necessitatibus velit cumque voluptas ex. Distinctio cupiditate voluptas autem repudiandae quisquam ea. Nostrum neque consequuntur commodi molestias illo eveniet quia.', 280.95, 60, 7.89, 'https://via.placeholder.com/640x480.png/004488?text=products+Faker+ut', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(18, 36, 23, 69, 0, 'voluptatum voluptas rerum', 'Et et earum inventore dolorem asperiores ullam natus. Exercitationem accusantium ab numquam rerum molestiae iste. Tempore eaque tempora similique in.', 426.91, 79, 1.29, 'https://via.placeholder.com/640x480.png/000055?text=products+Faker+ducimus', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(19, 12, 7, 63, 0, 'facere perferendis facilis', 'Minus sit voluptas qui et reiciendis et. Omnis ea natus consequatur et nihil modi. Vero et atque maiores voluptatem sunt.', 88.98, 19, 7.06, 'https://via.placeholder.com/640x480.png/002288?text=products+Faker+quis', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(20, 5, 39, 45, 0, 'qui nihil sunt', 'Itaque aliquid ut iste blanditiis laborum. Non tenetur asperiores facere voluptatem. Accusantium nemo beatae quas optio.', 353.26, 51, 6.31, 'https://via.placeholder.com/640x480.png/00ddff?text=products+Faker+dolorem', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(21, 30, 35, 43, 1, 'reprehenderit distinctio est', 'Consequatur iusto nulla voluptas doloremque asperiores rerum aspernatur. Iure quisquam voluptas rem consectetur necessitatibus. Fugiat expedita libero ut in harum tempore quibusdam.', 406.14, 29, 4.60, 'https://via.placeholder.com/640x480.png/0077ff?text=products+Faker+eum', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(22, 12, 31, 28, 1, 'id asperiores placeat', 'Qui ullam id omnis id qui quasi non. Et repellendus corporis unde consequatur quis ipsam ut fuga. At laudantium rerum dicta quia. Ad cupiditate corporis sed doloremque officia dolorum.', 508.37, 16, 1.83, 'https://via.placeholder.com/640x480.png/0011cc?text=products+Faker+nostrum', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(23, 32, 6, 41, 1, 'eaque ex quis', 'Tenetur ut magni non eum est. Quia alias accusantium voluptatibus corrupti. Voluptatem nobis eveniet dolorem cupiditate architecto. Dolores distinctio tempora iste libero voluptatem quaerat quo.', 376.38, 88, 1.38, 'https://via.placeholder.com/640x480.png/00bb88?text=products+Faker+qui', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(24, 27, 18, 62, 0, 'minima ad ut', 'Corrupti est tempore fugiat illum voluptates. Aut est quo distinctio aut. Quaerat dolorem qui culpa et. Nisi et quis cupiditate aut corrupti ad. Cumque incidunt harum aspernatur quia dolores suscipit quidem.', 844.2, 3, 7.72, 'https://via.placeholder.com/640x480.png/007711?text=products+Faker+et', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(25, 28, 34, 88, 1, 'ut sed eius', 'Accusantium minima et numquam sint culpa. Nostrum temporibus sed non illum sint soluta unde neque. Est exercitationem enim quod ex.', 98.32, 57, 7.78, 'https://via.placeholder.com/640x480.png/008811?text=products+Faker+similique', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(26, 4, 5, 66, 0, 'et quidem sint', 'Vitae tempore quisquam eius laudantium nisi nostrum vel. Porro et nemo omnis quasi pariatur assumenda molestiae. Quia nam et sapiente expedita delectus. Ut ratione inventore quae fuga dolorum fugiat.', 681.86, 54, 5.37, 'https://via.placeholder.com/640x480.png/00aa11?text=products+Faker+qui', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(27, 9, 22, 37, 1, 'cupiditate modi accusamus', 'Nam et nisi possimus autem pariatur praesentium. Sed similique laboriosam dignissimos expedita sit labore. Et officia facilis ut eveniet libero quod ipsum. Voluptates rerum in fugit dolores doloremque debitis.', 158.63, 55, 5.45, 'https://via.placeholder.com/640x480.png/006600?text=products+Faker+saepe', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(28, 14, 36, 1, 0, 'molestiae magnam blanditiis', 'Quaerat et a modi accusamus. Sed vel ducimus unde autem vero beatae esse. Ea hic cupiditate dolorum. Dolorum eos earum placeat at. Animi architecto dolor necessitatibus maxime fuga.', 971.99, 54, 9.95, 'https://via.placeholder.com/640x480.png/0022ee?text=products+Faker+quibusdam', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(29, 23, 10, 56, 0, 'et dolorem repellat', 'Perspiciatis quae neque optio sunt corporis enim quod. Nulla quisquam enim et omnis. Est officiis fugit dolor saepe quae voluptate dolore.', 94.31, 30, 6.94, 'https://via.placeholder.com/640x480.png/0000bb?text=products+Faker+voluptas', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(30, 38, 34, 73, 0, 'excepturi ducimus velit', 'Sapiente est aut quia similique et esse voluptatem. Nesciunt tenetur et eos. Quod quibusdam qui eos magni et qui aut.', 343.86, 4, 4.33, 'https://via.placeholder.com/640x480.png/0011dd?text=products+Faker+libero', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(31, 10, 7, 42, 1, 'voluptas rem iusto', 'Quis enim optio dolor animi voluptatum. Vel officiis repellat sunt alias doloremque. Eos quae eos aliquid reprehenderit libero voluptatem nostrum. Minima aliquam id voluptatem repudiandae fugiat distinctio.', 986.4, 93, 1.98, 'https://via.placeholder.com/640x480.png/0022aa?text=products+Faker+officia', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(32, 3, 16, 9, 1, 'voluptas saepe labore', 'Et libero placeat exercitationem et voluptatum id. Dolorem beatae repellat repellat magni. Facere quia ut consectetur aut voluptatem qui. Repellat voluptates exercitationem quos voluptatibus. Quos explicabo assumenda molestiae quia.', 407.59, 79, 3.99, 'https://via.placeholder.com/640x480.png/006688?text=products+Faker+mollitia', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(33, 35, 29, 72, 0, 'id necessitatibus molestiae', 'Dolorum quia eius vero rerum. Distinctio id voluptate illo. Debitis iusto rerum libero iusto dolorem et. Eligendi qui dolor rerum placeat id reiciendis. Ut ad et aut aliquid dolores blanditiis cumque voluptatem.', 992, 78, 4.58, 'https://via.placeholder.com/640x480.png/004455?text=products+Faker+eos', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(34, 13, 31, 101, 0, 'tenetur qui illo', 'Dolorum vel vel sequi qui aliquam aut. Deserunt eius ut laudantium temporibus qui est est. Mollitia eum possimus eos.', 584.01, 96, 3.49, 'https://via.placeholder.com/640x480.png/000077?text=products+Faker+illo', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(35, 28, 35, 9, 1, 'similique asperiores consectetur', 'Excepturi aliquid porro illum earum. Iusto saepe fuga dicta ab necessitatibus officia voluptas fugiat. Dolore illum sit sunt voluptates. Et soluta amet libero animi illo tempora excepturi.', 177.8, 72, 7.70, 'https://via.placeholder.com/640x480.png/00dd44?text=products+Faker+itaque', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(36, 40, 4, 74, 1, 'eum blanditiis omnis', 'Quo perspiciatis itaque earum eaque in nihil in. Sapiente aut modi mollitia eum magnam error. Expedita odit saepe harum.', 968.29, 68, 3.48, 'https://via.placeholder.com/640x480.png/00cc22?text=products+Faker+sequi', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(37, 23, 14, 35, 1, 'qui aut nulla', 'Illo doloribus soluta omnis temporibus. Aperiam soluta aut ratione inventore molestiae laboriosam. Animi fugiat aspernatur dolorem ut vel dolor cumque. Similique consequatur sapiente reiciendis ea perferendis.', 581.12, 51, 2.46, 'https://via.placeholder.com/640x480.png/001100?text=products+Faker+fugit', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(38, 2, 31, 60, 0, 'magni et itaque', 'Ut qui commodi et et consequatur quisquam quod. Dignissimos dolor ea odio officiis. Non ipsam placeat facere quo aut. Tenetur nobis possimus ut cumque sunt officia maxime.', 523.12, 11, 1.86, 'https://via.placeholder.com/640x480.png/0033cc?text=products+Faker+quis', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(39, 28, 31, 59, 0, 'quasi perferendis atque', 'Necessitatibus omnis corporis eos quae ullam et cumque. Eaque at voluptas vel iure occaecati aut omnis.', 468.36, 12, 8.36, 'https://via.placeholder.com/640x480.png/00ffdd?text=products+Faker+porro', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(40, 8, 38, 66, 1, 'illo reprehenderit quasi', 'Nobis ut officiis ratione sunt aut. Ut quae temporibus earum perferendis voluptate sit. Et quia voluptates omnis ea. Omnis voluptatem sapiente atque dolore et voluptas. Eum praesentium voluptatibus nemo ducimus reprehenderit.', 810.45, 79, 1.86, 'https://via.placeholder.com/640x480.png/00ccaa?text=products+Faker+cupiditate', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(41, 22, 9, 10, 0, 'sequi voluptates pariatur', 'Et nulla dolor non iusto fuga quia. Asperiores dignissimos ullam consequuntur. Atque dolorem dolores velit corporis dolor ad.', 978.8, 49, 4.70, 'https://via.placeholder.com/640x480.png/006611?text=products+Faker+natus', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(42, 33, 6, 83, 0, 'deserunt ea laborum', 'Ut sunt provident ut fugiat omnis sunt. Quia odio ut ut asperiores dolor est et eveniet.', 422.23, 73, 8.42, 'https://via.placeholder.com/640x480.png/003322?text=products+Faker+debitis', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(43, 37, 28, 36, 1, 'eligendi sunt sed', 'Sequi laudantium excepturi fuga dolores laboriosam quia dolorem. Quia est fuga eos maiores id sint. Qui alias minus architecto molestiae ut.', 206.26, 41, 1.88, 'https://via.placeholder.com/640x480.png/00bbbb?text=products+Faker+quam', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(44, 1, 38, 30, 0, 'commodi culpa perferendis', 'Non rerum similique soluta sint sed. Quos et praesentium aspernatur. Natus similique rerum eligendi modi accusantium sit maxime.', 118.09, 91, 8.66, 'https://via.placeholder.com/640x480.png/0044cc?text=products+Faker+animi', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(45, 2, 25, 83, 1, 'ut ut sapiente', 'Aut ipsum dolores aut omnis porro enim. Est atque rem itaque quia facilis. Voluptatibus ut beatae cumque nostrum.', 630.32, 70, 8.65, 'https://via.placeholder.com/640x480.png/003355?text=products+Faker+ex', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(46, 35, 34, 8, 1, 'cumque corporis eligendi', 'Dolore velit consequuntur rem consectetur. Exercitationem aut velit quia quia ut excepturi. Dignissimos tempore molestiae ratione qui at omnis eveniet. Ex unde molestiae rerum magni iusto maxime.', 307.16, 95, 5.65, 'https://via.placeholder.com/640x480.png/0022ee?text=products+Faker+libero', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(47, 2, 40, 67, 0, 'consequatur excepturi et', 'Nam reiciendis autem hic autem quia facere. Repellendus quo odio quae natus perspiciatis earum quo. Earum deleniti maiores occaecati beatae fugit in. Similique explicabo iusto totam quia omnis est velit suscipit.', 469.62, 37, 2.66, 'https://via.placeholder.com/640x480.png/004455?text=products+Faker+aut', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(48, 13, 4, 97, 0, 'facere rerum dolores', 'Voluptatem veniam animi consequatur ab. Minima voluptatibus neque nobis rerum suscipit et quis. Est sapiente eum praesentium voluptas alias.', 153.01, 60, 2.85, 'https://via.placeholder.com/640x480.png/005544?text=products+Faker+aut', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(49, 16, 6, 15, 1, 'nisi earum earum', 'Commodi consequuntur nesciunt ad mollitia incidunt. Omnis laudantium alias et ut vel similique. Quas vitae non repellendus omnis optio consectetur consequatur.', 258.41, 82, 9.09, 'https://via.placeholder.com/640x480.png/000022?text=products+Faker+sed', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(50, 39, 20, 20, 0, 'dolor in fuga', 'Rerum deserunt enim reprehenderit ut. Voluptatem explicabo dolorem maiores error sit.', 774.41, 61, 6.57, 'https://via.placeholder.com/640x480.png/000055?text=products+Faker+explicabo', '2024-11-28 04:03:38', '2024-11-28 04:03:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Strosin-O\'Conner', 'Mr. Kelvin Auer DDS', '+1 (561) 936-9664', 'bailey.clarabelle@example.net', '653 Fahey Mountain Suite 369\nOlinview, TN 97324-5158', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(2, 'Runolfsdottir-Legros', 'Allie Baumbach', '708-520-9622', 'georgianna67@example.net', '7890 Cruz Bypass\nSylvanfurt, IN 41251-5024', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(3, 'Durgan-Bailey', 'Antonette Kreiger III', '941.928.2271', 'jalyn.cummerata@example.com', '7187 Witting Points\nEast Rossie, TX 07148', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(4, 'Turcotte, Terry and Lesch', 'Dr. Angel Balistreri I', '+1-973-464-2757', 'pagac.jayden@example.com', '7499 Sporer Islands\nSouth Woodrow, KS 36184', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(5, 'Jacobi-Brown', 'Jarrett Kozey II', '+1.847.966.9513', 'jeffry69@example.org', '29767 Russel Park Apt. 696\nXavierberg, MN 76096', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(6, 'Boyle-Green', 'Dr. Tristin Hagenes', '586.594.9023', 'elbert85@example.org', '28586 Wiza Lights Suite 926\nYostton, VT 70128-5625', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(7, 'D\'Amore, Brown and Quigley', 'Stone Mueller', '+1 (551) 253-0472', 'franz86@example.net', '2083 Murphy Cliff Apt. 646\nLake Franco, OK 44694-9721', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(8, 'Kunde-Gislason', 'Dr. Sheridan Cormier', '725-269-2895', 'dwuckert@example.net', '45716 Josefina Throughway\nCroninton, HI 90034', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(9, 'Carter, Emmerich and Hills', 'Miss Laura Morar', '1-508-232-4804', 'dominique73@example.net', '9284 Ally Station Suite 720\nWest Alena, TX 00228-0361', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(10, 'Larkin-Schultz', 'Courtney Bartell', '1-813-434-0031', 'damian23@example.net', '7456 Becker Glen Apt. 773\nLake Feliciabury, AK 65081-0717', '2024-11-28 03:56:16', '2024-11-28 03:56:16'),
(11, 'Anderson PLC', 'Ms. Amelie Tromp', '+16786605356', 'ejohns@example.net', '5044 Wilderman Shore Apt. 234\nWest Blanchetown, AK 35173-4445', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(12, 'Runolfsson-Cormier', 'Prof. Bridgette Williamson PhD', '248.223.4839', 'jenkins.lorena@example.org', '285 Tyrell Stream\nBrekkeberg, PA 16896', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(13, 'Sauer Group', 'Trystan Yundt', '1-520-330-8034', 'darian.treutel@example.com', '5656 Goldner Trail\nMillerchester, MI 85668', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(14, 'Stanton, Davis and Haag', 'Prof. Wilfredo Hahn V', '1-913-341-8166', 'laron.luettgen@example.net', '196 Hazle Cape Suite 203\nWest Jarrod, IA 58259', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(15, 'Dicki-Wunsch', 'Omer Beahan', '1-650-321-0946', 'rosa41@example.net', '8763 Adams Pass Suite 368\nTremblayberg, HI 23226-9959', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(16, 'Kreiger-Batz', 'Prof. Alysa Okuneva', '+1.669.233.5813', 'vandervort.chris@example.org', '9237 Hyman Court Suite 335\nWest Dale, PA 20514-4922', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(17, 'Donnelly-Eichmann', 'Shanna Nienow', '1-971-931-1807', 'derick.mayer@example.net', '12181 Torphy Keys Apt. 938\nEast Tomas, IA 28980-2411', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(18, 'Weber-Ullrich', 'Ulices Wiza', '(682) 335-2130', 'okohler@example.org', '79063 Schuster Mews\nPort Eli, AL 83614-3447', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(19, 'Hermann-Bahringer', 'Mr. Baylee Johns I', '559.767.0151', 'olson.kariane@example.com', '188 Medhurst Estates Apt. 716\nSchroederborough, SC 56745', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(20, 'Waelchi-Mohr', 'Orpha Padberg', '+14787713733', 'anienow@example.net', '6079 Marcella Dam Suite 401\nWest Sydnie, OK 97851', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(21, 'Collier, Zboncak and Koelpin', 'Dr. Anissa Kuhic PhD', '+1 (248) 249-9728', 'neoma12@example.com', '55905 Angeline Manors\nEstefaniaville, FL 47160', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(22, 'Cummings-Kuhn', 'Linwood Nicolas', '303.707.6959', 'reichert.cloyd@example.net', '1801 Chloe Roads\nImeldamouth, NC 11213', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(23, 'Pouros-McKenzie', 'Vena Maggio', '(561) 878-8962', 'alexanne.abshire@example.com', '523 Hannah Square Suite 508\nLeschtown, MT 57965-7554', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(24, 'Waters, Hoeger and Effertz', 'Meda Waters', '+1.276.927.2558', 'bdavis@example.org', '40050 Corbin Ports Apt. 488\nTanyachester, CA 64038', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(25, 'Zemlak-Lang', 'Mr. Sylvester Reynolds MD', '(463) 997-7255', 'rusty64@example.net', '164 Rohan Skyway\nKutchfurt, DC 05580-0116', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(26, 'Jast Group', 'Prof. Annabelle Kiehn', '+18168888878', 'lkeebler@example.net', '8719 Kirlin Cliff\nWest Jessica, VT 31750', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(27, 'Trantow-Collins', 'Jackie Casper DVM', '(760) 837-0396', 'krajcik.elenor@example.org', '621 Augustus Lakes Suite 865\nPort Jessie, IL 52387-8535', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(28, 'Vandervort and Sons', 'Emery Botsford', '715-694-0101', 'ereichert@example.org', '2638 Annamae Circles Apt. 549\nLake Abelardoberg, NC 51861', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(29, 'Gulgowski, Stracke and Predovic', 'Isac Huels', '(854) 862-6844', 'jordi.hilpert@example.net', '665 Weber Harbors\nLaishaland, VT 96993', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(30, 'Monahan, Walker and Anderson', 'Ms. Dianna Armstrong', '+12817318776', 'doris30@example.org', '8612 Shaylee Corner Suite 691\nEast Willard, MN 24813-0462', '2024-11-28 03:57:46', '2024-11-28 03:57:46'),
(31, 'Sawayn-DuBuque', 'Prof. Wilber Herzog', '351-302-5972', 'rebekah02@example.org', '57959 Rosenbaum Plaza Apt. 808\nLangland, TN 82746', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(32, 'Beatty-Mann', 'Abdiel Gleichner', '1-423-374-7020', 'jameson24@example.org', '961 Albin Camp\nMillsfort, WY 69326-1351', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(33, 'Swaniawski, Feeney and Koss', 'Giovanna Kuphal', '435-254-2813', 'camilla.lindgren@example.org', '4860 Watsica Center\nIrwinland, MA 14133-7221', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(34, 'Mills, Hand and Hermiston', 'Winifred Lebsack V', '+1.539.784.6807', 'nia.wisozk@example.net', '37928 Natasha Summit Apt. 602\nEast Mariela, NY 86172-6862', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(35, 'Mills-Osinski', 'Kailee Kiehn', '971.522.5018', 'sarina05@example.com', '687 Volkman Orchard Suite 093\nNorth Freidaville, VT 96195', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(36, 'Davis, Wilderman and Kshlerin', 'Kyleigh Klein', '1-623-782-1136', 'frankie52@example.com', '93681 Tyrell Expressway Suite 092\nTurnerfort, GA 50458-8640', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(37, 'Crooks-Pouros', 'Miss Liza Gutkowski II', '+1.720.209.3735', 'kirstin.emmerich@example.net', '342 Littel Ville Suite 566\nOpalport, OH 05687-2159', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(38, 'Kuhn PLC', 'Icie Anderson', '510-665-1209', 'brandon.konopelski@example.org', '31076 Skiles Mountain Suite 032\nFrederikview, PA 00718-0972', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(39, 'Marvin Group', 'Abagail Wisozk', '(208) 290-3122', 'vstamm@example.com', '431 Robyn Ports\nNorth Roselyn, MI 51284', '2024-11-28 04:03:38', '2024-11-28 04:03:38'),
(40, 'Anderson, Marquardt and White', 'Mrs. Shea Boyer', '(832) 746-9462', 'lela92@example.org', '63135 Jaskolski Isle Suite 819\nPagacchester, NM 37323-6288', '2024-11-28 04:03:38', '2024-11-28 04:03:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `role`, `status`, `password`, `hp`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', '1', 1, '$2y$10$5oHhOgefnjuCj8B8JFOF9OWSUOXTPjx.Y22o5BFMtQkyiPZoZa5eC', '0812345678901', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(2, 'Sopian Aji', 'sopian4ji@gmail.com', '0', 1, '$2y$10$knXjBU5w/Vu9mSgI46v.8uMIiIoD3OcoSioqhMLKt9iariv0Nq0Ae', '081234567892', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(3, 'Dr. Tito Halvorson IV', 'user1@example.com', '0', 0, '$2y$10$JDQZbDr0Y9dMKjB7SJ8UbOUgrA1RC/JWjgGODFPor26uu4IkkuCRa', '+1-726-339-81', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(4, 'Yvonne Kub', 'user2@example.com', '1', 1, '$2y$10$/ym29zr9RnnSWKDtpFOMceh8KtHfH5KmiMhtAKqkZSCIh2UtLiDbW', '1-603-715-339', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(5, 'Prof. Aniyah Heller', 'user3@example.com', '1', 1, '$2y$10$g03NPac8LTzUN4wfUnB20exAx34bx/ya/pGg0TyMU5gx6iL2qpCvC', '+1.352.772.37', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(6, 'Harrison Reichert', 'user4@example.com', '0', 0, '$2y$10$LJckYhcNin2itYBRz3zbte3stRCbXPbATsdfV8Oh0ohFqo8GQmNlG', '1-469-424-260', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(7, 'Prof. Sven Kunze IV', 'user5@example.com', '1', 1, '$2y$10$NyHaqU4jD/WWBUxalM0ubu//ponmdGjjA/LgeFaduKS4HEs.KUdJy', '+1-626-987-20', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(8, 'Emmanuel Lehner', 'user6@example.com', '0', 1, '$2y$10$2kT8XLUe30pX3otyCebaH.1xWAynT/Xp7plEk1YDysaR3MQpZrlGq', '+1-786-610-44', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(9, 'Miss Chyna Rowe IV', 'user7@example.com', '1', 1, '$2y$10$7O09wkytK0.URABram0X5eeOycOj7/wwT.HlpmVwAF3vAZFtIGOyK', '+17474121391', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(10, 'Mabel Gleason', 'user8@example.com', '0', 1, '$2y$10$o7vxtAiZVh6bTayIsVdZy.q6Ov3.B2VOI7.QEDtz8KaWWm.jiH9Rm', '+1.564.330.62', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(11, 'Dr. Cristina Cruickshank Jr.', 'user9@example.com', '1', 1, '$2y$10$kBL5/CplFbgnyllJuuzIF.jFHTpEVY.ouRoRAAwseQsDNie/EL4CC', '(838) 334-424', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(12, 'Cortez Cassin', 'user10@example.com', '1', 1, '$2y$10$jPLsMHNkXLF0F7ap44YgGONd.4RyrXbVN5LhcZ8Onwb62BHOALXhi', '731.417.1589', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(13, 'Imelda Mertz', 'user11@example.com', '0', 0, '$2y$10$qeyYpaEBtbCqffhJkoYzD.Kzn6zYWmG6Oe7NOiEcUMYD7WaSNcwGC', '1-442-940-822', NULL, '2024-11-28 03:52:25', '2024-11-28 03:52:25'),
(14, 'Aric Walsh', 'user12@example.com', '1', 0, '$2y$10$/b8Kg4Kng29xfQZlanOs5em8DMi8Z5APuPvFlI.v7b9vlpT2sQl8u', '+1 (256) 971-', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(15, 'Garth Jacobi', 'user13@example.com', '1', 1, '$2y$10$7dkXEa9BIi5jhtU4gt1.ouL1Xub5z76axUPmH.ylfQ/fl8khfbcYW', '+1-364-273-04', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(16, 'Mrs. Tyra Hammes', 'user14@example.com', '1', 0, '$2y$10$lrJQKvJGE/pHiBQEcWOnJeD.kdtfOR3VMimxlTDqN9pqwNG1bjwSO', '972-522-5021', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(17, 'Dr. Erik Morar', 'user15@example.com', '0', 1, '$2y$10$VloT1DJysrCEL4ZE81A62O2e0A3zF9FXYOnTO9CrsFe41RCRYdMV2', '+1-831-603-00', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(18, 'Ottis O\'Conner PhD', 'user16@example.com', '1', 0, '$2y$10$ziT25esctZ0zVZF2fABhU.NUxaG4ymWVCu0vDVUcNGQjN.bTTe40e', '361.632.9803', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(19, 'Barton Pollich', 'user17@example.com', '0', 0, '$2y$10$Zl5ItCFqxxHV0Oaoqerj0.1n.lT1A4wLcs1wMbOP0wfFDOHPSBGtC', '1-845-351-866', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(20, 'Jamie Morar III', 'user18@example.com', '1', 1, '$2y$10$qZxyCLLHClAPU7cblhjAT.3reYbvjEA5cudqh.ZooAKcyNZz0IyB2', '+14143620130', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(21, 'Lonie Murray', 'user19@example.com', '0', 1, '$2y$10$679v.QPGf8cl75bfzAYr/OYwSO86qG/rJCTanyzu3oOvBwXhV311K', '970.768.2161', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(22, 'Jake Vandervort', 'user20@example.com', '0', 0, '$2y$10$m6VLO3QTch.g2EfjU4XdkumCLp8UdpOKBBehmE/lgbehooXIzf9Ka', '+14803454614', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(23, 'Preston Cruickshank', 'user21@example.com', '0', 1, '$2y$10$aFktUHIVIGMW7Gg4QAB7M.TX7bd1ffCYguGnRn7j1SPoixos5Cvza', '707-279-4940', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(24, 'Donavon Ruecker', 'user22@example.com', '1', 1, '$2y$10$2J.CnEF.9bzsphijKqlU7Ov9lB8iOhKqPor87c18vzamfokOzINFu', '689-313-1950', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(25, 'Faustino Hansen', 'user23@example.com', '1', 1, '$2y$10$nd2VxuOK8yGUOOmq154DSuQJkTWeSL.60lvxDY.oE4V/4Q7hG8WEe', '+1-424-536-05', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(26, 'Alfonzo Eichmann', 'user24@example.com', '1', 1, '$2y$10$h7UZhTG17gfljR9FSc2jJurrtepXosDs2oExZPYqmYDHb2RvSyTne', '1-323-920-234', NULL, '2024-11-28 03:52:26', '2024-11-28 03:52:26'),
(27, 'Mr. Osbaldo Morar IV', 'user25@example.com', '0', 0, '$2y$10$KBy48DP4gACWxY9aUenIF.992vjM9L5onXbtR7y/grDeNzzONgz1.', '843.248.0284', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(28, 'Dr. Doug Schinner', 'user26@example.com', '1', 0, '$2y$10$eCseMu0F77eJQSKmy4KE..hOJ9IwDaRV2uv.0CGNb69gmg./KC0/6', '(714) 723-592', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(29, 'Gretchen Jaskolski', 'user27@example.com', '0', 1, '$2y$10$1sk8oQo2qwA435isRsSUceEVXOlub.BTHSRtlhrJ14Oh/9/OIjoMm', '701-662-3115', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(30, 'Iva Hand', 'user28@example.com', '0', 1, '$2y$10$JWKPij2CwokIFJp6tQxZZOeh0b.ddEWvhEvadsoPX/Az89FmKu7Aq', '(860) 996-749', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(31, 'Dr. Annamarie Nikolaus', 'user29@example.com', '0', 0, '$2y$10$cA8He1uoMZPL7vbJJRgmn./5atNdt0aR0p7lEHBmCSOtfGWCFXy62', '606.606.1395', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(32, 'Ruby Gleason', 'user30@example.com', '0', 1, '$2y$10$oo3OhRNpOG05Z2qmFqb58.Zw.Pto5m1TptweMPsjcEKyWb/eqg0cK', '+1.737.503.91', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(33, 'Miss Haylie Reilly DVM', 'user31@example.com', '1', 1, '$2y$10$9slZ2R2u7LEEUuCOakglz.gLHZXZEuQZmpgF9dyKU5jIc3ymrENXu', '503.562.0796', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(34, 'Shirley Braun', 'user32@example.com', '0', 1, '$2y$10$9MaZ3da35F1IgmFR9SLNi./Pxp324KJ4C0ivFODzS2Wst24QRwwYy', '360.953.3319', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(35, 'Mrs. Amanda Zboncak DDS', 'user33@example.com', '0', 1, '$2y$10$iVXTiez61.b0lSn7Bp0dresKr9LjMh.qjAeSYxX27U.QmNX7/oo6q', '432.613.3920', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(36, 'Eden Ankunding III', 'user34@example.com', '0', 1, '$2y$10$GhUHw7uO2UCn2WAIntnAd.6A08OBncYEfsml/k53m/87BHyAstNy2', '+1.681.201.59', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(37, 'Aaron Veum', 'user35@example.com', '1', 1, '$2y$10$y8UzrrPw0G8NfnBnSb7eaeOD2HKtVRWT4TukMALfoHIUnbDFMcGk6', '1-339-985-553', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(38, 'Aliyah Hilpert', 'user36@example.com', '0', 1, '$2y$10$4Ew7G8Lb9DBjRaUrUbT/0ORuyo96TqbSVAjwX0pRPerAtMumIIgKO', '(580) 219-917', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(39, 'Miss Gertrude Becker IV', 'user37@example.com', '1', 1, '$2y$10$U40jTF8AAymGArUvOxq81Ori9uEcUbbGKb4CFWXkgNIUNCu1lNxzu', '+13148648379', NULL, '2024-11-28 03:52:27', '2024-11-28 03:52:27'),
(40, 'Megane Kirlin', 'user38@example.com', '1', 1, '$2y$10$0.ytMP4nEmjiqXWO1UyqBOeS0f0sadxkye7O4D46/llWQTCd9yFM2', '1-332-372-614', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(41, 'Nikita Block', 'user39@example.com', '0', 1, '$2y$10$PREhAa/qwHJ7/xNoZiQ0G.SCfFZMcdWkz44VJMILBUVw2zONfFgHm', '+1-220-502-67', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(42, 'Madeline Bahringer V', 'user40@example.com', '0', 1, '$2y$10$v.F3cp6Httn2QGUx3BI95OrOOxh0BJkaN7rq03n8pGCI9UrBRS9qO', '+1-351-710-47', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(43, 'Axel Ferry', 'user41@example.com', '1', 1, '$2y$10$tBqov9rpucDrVmqMp7rwy.7YYFi5LC8YHU46WdXD387JFUgLOldJy', '+1-317-373-58', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(44, 'Mrs. Abagail Fadel', 'user42@example.com', '0', 1, '$2y$10$6mH1vpIXbeDAmtKP9rmK4O70alMbCxfoOgx1WW5PG4bEctdxePb/G', '(223) 739-632', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(45, 'Haven Sawayn', 'user43@example.com', '1', 1, '$2y$10$4ILN0tU5GTcWsrQABnlcXuP6U4wIDuCdvCuXXCLP0I.wKDjOR.4wu', '(478) 794-604', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(46, 'Mr. Randal Hamill DVM', 'user44@example.com', '0', 1, '$2y$10$9xls/.xskQu0h6O37XeUzejrNFvYYdDLKweXpmDdrinypBcDHfROe', '(720) 361-251', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(47, 'Vidal Kutch', 'user45@example.com', '1', 1, '$2y$10$avGwQ1JvUCUM5y74OBZdgedngiKybppqaEeP3Cbq2tBbaoResS9tu', '857-725-9395', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(48, 'Prof. Darwin Goldner III', 'user46@example.com', '0', 0, '$2y$10$Jr6xRMqI5Xg7Spqi.q3Nq.p7SynjGXqzKAuRONbOeYgQ8D44862Ai', '(409) 933-177', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(49, 'Miss Kiara Murray MD', 'user47@example.com', '1', 0, '$2y$10$.if7C22hashO5AQPdm0SaOpgcQqJRyoZb8wm.XWthY7MDuk4MD9J.', '+1 (737) 367-', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(50, 'Joseph Marquardt', 'user48@example.com', '1', 1, '$2y$10$JCTf8K4sOTyIFulO8FrCP.Bu33l1JCOhamVlUXF.3eN.iGFjik2Sm', '(858) 392-089', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(51, 'Mr. Art Mraz', 'user49@example.com', '1', 1, '$2y$10$evFZlE.D7XuAZAgcE1CD1Oy8ZGeXBlB731riwPKU3BHdaVWmCIjGW', '630-613-2181', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(52, 'Dr. Samara White I', 'user50@example.com', '1', 1, '$2y$10$T5uownJt/y/UnmPU4SM58uTVnBn.1fS9GyXpl4rqxZp1XbPPviqIG', '1-608-785-383', NULL, '2024-11-28 03:52:28', '2024-11-28 03:52:28'),
(53, 'Johan Hoppe', 'user51@example.com', '1', 0, '$2y$10$Z7OUB0Mm0SBkwF70nb.YVO6zTm98vwkkYiUNQ6tIQyM2ECjMtPQ46', '+1.609.260.61', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(54, 'Billie Lemke', 'user52@example.com', '0', 1, '$2y$10$kz.awLYbeSE1s4G7PdeR.e25JZDiCQYLOid41.RiF51HMDwPpJcQ2', '1-951-666-470', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(55, 'Prof. Kaitlyn Huels DDS', 'user53@example.com', '1', 1, '$2y$10$AYFJbteD9fS7waXhoFSWPOgRzFoY8CtAR3Or7R1wWcF/5/yzaV6MS', '682.673.1653', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(56, 'Cecile Lesch', 'user54@example.com', '0', 1, '$2y$10$sR3oQSou04hU0MZtFjh0.uxRCziKXI5TPTNa7M6w7KOTMaonZEG.K', '(475) 369-347', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(57, 'Nicole Rau', 'user55@example.com', '0', 0, '$2y$10$Sff/xTJZlh.HwWhITIiHiOo2peK9BdvrNxMxzX4h3uG77sPwm.d56', '+1-830-659-39', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(58, 'Triston Miller', 'user56@example.com', '0', 1, '$2y$10$ZWZNSswpFNz2yoxw7Jl/E.6wjxuK.UwZn2yMc8EAach5maGT.tkA.', '863-208-5410', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(59, 'Frederik Stracke', 'user57@example.com', '1', 1, '$2y$10$oLcphhtyfohIFTB5b2sOuOlZYtBSQ9g4Te3Rvoa1r/YktVGkQx03W', '262-292-9825', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(60, 'Dr. Rashawn Baumbach', 'user58@example.com', '0', 1, '$2y$10$6M4xw3BSOKDUueVHr9cIn.wO6olRdTX/aPf97Mwe1P5Xk9N6gx3IS', '540-450-6465', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(61, 'Dr. Junius Stehr', 'user59@example.com', '0', 1, '$2y$10$JtYNuryfG5X26994wgmCquJsw54pSgxK1yNFMSelZqwFEk/pTOcbC', '+12252992973', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(62, 'Maximus Durgan', 'user60@example.com', '0', 1, '$2y$10$kT6yZmxuR0QqBPjjeYFMz..4ZbXQHzLQIoCdq3ztrmULj2uGePp12', '+19413053323', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(63, 'Ezra Rolfson', 'user61@example.com', '1', 1, '$2y$10$.XZf2WR8AMAoUlaEuruMj.Bg5WxYUhMpJHp5TjuQP4Nkbk/FYWmDK', '+1.941.754.27', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(64, 'Helen Corkery', 'user62@example.com', '0', 1, '$2y$10$r8A2qe59tewfO4gPCkpS1OBaM5i1MIDjWjSDX0t1nYASPY71mz6Iy', '(206) 656-867', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(65, 'Haleigh Walter I', 'user63@example.com', '1', 1, '$2y$10$Fmecnq6ihqZdZnnJXEkIwe1C/BfpHVnHplYRF7M4DLQKMsAfOEZWS', '+16316371969', NULL, '2024-11-28 03:52:29', '2024-11-28 03:52:29'),
(66, 'Octavia Dach', 'user64@example.com', '0', 0, '$2y$10$MQ2gHbwBjO1ORR8pqYX7ze0KdTOWW.rkBon2FeOvY7JrTXdhmgY7G', '(432) 304-811', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(67, 'Doug Green', 'user65@example.com', '1', 0, '$2y$10$8IWU3KOyumFOQTfAXTMPa.OFhPplLgSWcqoBrTmWSxhS2Sy4mjM5W', '+1.859.922.83', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(68, 'Jolie Daugherty', 'user66@example.com', '0', 1, '$2y$10$h6PHdIS7muDpTNZyTJ6X1eIdn.q54smbtdZU3JKbfQD51Bfe1bTO6', '+1-364-587-87', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(69, 'Prof. Hannah Runte', 'user67@example.com', '0', 1, '$2y$10$3w4Bja6qSUirXmIpCdquSeEB8tfh5wfhVMqemGdR/5f2GlKaMnSWO', '+1-803-786-66', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(70, 'Winnifred Rutherford', 'user68@example.com', '1', 1, '$2y$10$rrOnXrkB3fFl9Ex15ag/1O/s3ebnMOeRaSEvS8NoTv6ROWa.ZU782', '719-217-4410', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(71, 'Claudia McClure', 'user69@example.com', '0', 1, '$2y$10$OzdxG4PAYuG3H3dDmh2Jf.FEblGSWGTSi8ft1eTja1dkpOStnRGlO', '213.989.6239', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(72, 'Ayla Jaskolski', 'user70@example.com', '1', 1, '$2y$10$NZMDdbS6cm7ko.J.wzaG9OhY9.hDPCGfYBuMVJVDo0s2uF85277Py', '1-781-937-690', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(73, 'Adriana Pfannerstill', 'user71@example.com', '0', 1, '$2y$10$u66hMv5lrUU94tA2WGj7wOSJQoHhBG8FOJQkZRBcO9l88NCTkzSoq', '534-854-1582', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(74, 'Rigoberto Treutel', 'user72@example.com', '1', 1, '$2y$10$wYn6ky80nySoX4zXdxmRQeQhLvvkBROuobTS5PpRBWf1SOLHmty9G', '501-805-7722', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(75, 'Taya Wyman MD', 'user73@example.com', '0', 1, '$2y$10$9OCRJo.yoNxf1Zkk3yELvuSEaDAmo8MxRx5C7S0Xvtc4Gv7ZJ22Ne', '248.265.1768', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(76, 'Ethyl Kohler', 'user74@example.com', '1', 1, '$2y$10$LpQz9mjfrX056v/OFNu7a.TCS5NQnRkf1GH68oov9zo6aXB/RIl4S', '+1 (262) 765-', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(77, 'Ms. Shirley Batz', 'user75@example.com', '1', 1, '$2y$10$yJ8NBjwYWNFieOWp9DqTZuvAhBPNLwRaMldhMoVWjOYIA4It0zBei', '+1.318.962.67', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(78, 'Burley Marks', 'user76@example.com', '0', 1, '$2y$10$t/JgGC2ymWgKDtPFXYD0U.Va1lyBAC1h5GmRfbTF7/5aFXOoDdfUW', '1-424-274-323', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(79, 'Cynthia Stark', 'user77@example.com', '1', 0, '$2y$10$la1ZyhrVYzNj44uVqY7Wte0eiA6l.649mFP7DpShv9zG5CYJ/0OLu', '678.268.6916', NULL, '2024-11-28 03:52:30', '2024-11-28 03:52:30'),
(80, 'Jeanie Littel PhD', 'user78@example.com', '0', 0, '$2y$10$dpz6KxQq99q5BbuyWaCzqedQdyI/93ZyuYy2cpLnFGQfeMrpvcyRK', '(903) 844-009', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(81, 'Zakary Waelchi', 'user79@example.com', '1', 1, '$2y$10$4JwkEjWylQvMJnsL1bq58e19n60vk9yzqtCYQ7p9q5Bnl9Sw3cRN6', '1-386-533-037', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(82, 'Lempi VonRueden', 'user80@example.com', '1', 1, '$2y$10$0BJwOFtPM5S8IN4bRBGVKeQtpeSio65hdUP1dDTtrWQgK.doQNtda', '603-854-6511', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(83, 'Creola Goyette', 'user81@example.com', '1', 0, '$2y$10$BqYDTN57q4qi6A6ryiSv9eOaUr7GTZUgL0qEoXRqh0JP7ANHGhOQK', '+1-660-224-04', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(84, 'Prof. Maynard Predovic', 'user82@example.com', '0', 1, '$2y$10$xtg7qyjRpFoUyLqQP3DvCupwb3Y5pcici4XWHr8hzbZzttcKHEct2', '+1-321-309-47', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(85, 'Luigi Schimmel', 'user83@example.com', '0', 0, '$2y$10$tG0CM9LvaHVM6vRzKeuOpeyfIJe9gnydyal1DCUTCcX/BRWaS1a7O', '+13469152423', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(86, 'Erin Bins', 'user84@example.com', '0', 1, '$2y$10$4p65wymkrHWKDhaoLG7Io.E31l2dQTuB8mUifuH9CTHzvngGzJoQS', '+1 (820) 369-', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(87, 'Roselyn Spinka I', 'user85@example.com', '1', 1, '$2y$10$194ZXcr1a.ypwuMWRIiWTukI89xxjWk9.cddnWE3zFB6C/rmGHqzS', '+1-731-361-09', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(88, 'Prof. Nathanial Corkery', 'user86@example.com', '0', 1, '$2y$10$0Oo02rXYkTRfrAXEdkKSrOghwzLpibKPBurz8XjFZif.0y4B89.aq', '872-620-0534', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(89, 'Vallie VonRueden', 'user87@example.com', '0', 1, '$2y$10$E036nlXoXk.eSfGrOTrJVuKsnMFqCV6B824RHYUAC/Ux2DlAkcevm', '+1-404-991-64', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(90, 'Ms. Therese Kihn PhD', 'user88@example.com', '1', 0, '$2y$10$t0Shz8wy6yvPkpGBmylhrexOCuuMdN13vDdKX3U5shbOF7SOnUKfG', '+1-760-364-26', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(91, 'Willard Lesch III', 'user89@example.com', '1', 1, '$2y$10$He1JpsHgrK3hI5j3Ke.Q..xF5FT7/tyN8/mjeF48FKeTajJ39.QBm', '(628) 965-319', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(92, 'Oceane Flatley', 'user90@example.com', '0', 1, '$2y$10$FMrNQWsLu6NJaaZIrY/ug.dFJU17DpNoWN1m4t6v0v9sOHX1qARbq', '+1-703-949-99', NULL, '2024-11-28 03:52:31', '2024-11-28 03:52:31'),
(93, 'Kelsi Flatley', 'user91@example.com', '0', 0, '$2y$10$VcaxeMiNTyZYdgQkRSR5MuRou39YbrGDBPKig7uBDekTnsuIZC2s6', '708.760.4525', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(94, 'Gust Senger', 'user92@example.com', '0', 0, '$2y$10$1EsHNpPprXad/YXcPaaqf.dy5MTWvb2B.SkqdVOjmXy.1pnakoxaS', '806.787.6106', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(95, 'Betty Champlin', 'user93@example.com', '0', 1, '$2y$10$mQC6jNP6SE2/J2Q6Mi98MeYb2og5jYdjNkACH0saJ/vZDp9n.r4VO', '458.216.5250', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(96, 'Kaleigh Kshlerin V', 'user94@example.com', '0', 1, '$2y$10$.LF1hA8.dtyHOgyRiVH6h.48hhBntH3vHBJ29IM06Eja0pvEXDEwK', '(361) 931-136', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(97, 'Lisandro Bailey', 'user95@example.com', '1', 1, '$2y$10$R/GICsJNLcAAaQbKFJAeZ.ivI1UV/HZy.R0EHlWw.ttyNE37OtdmW', '1-818-572-320', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(98, 'Prof. Wilfrid Lueilwitz MD', 'user96@example.com', '1', 1, '$2y$10$RD5JsyrMRiVQulaNisTKLORsOCKhc8UfFQOX/z/wkeRI9YhtYBQDy', '830.517.4479', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(99, 'Enola Tromp', 'user97@example.com', '1', 0, '$2y$10$cggQKs.qPBvKvsmB1ImgO.nGREJELE3ZTKjbgMz6M/L6qlzUyG7LS', '1-727-613-529', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(100, 'Lonie Lehner', 'user98@example.com', '1', 1, '$2y$10$NWiDQX8LV.6AsWHl.FygierOyXwnhta79gCeWvGxCkTpLJ6ia41BK', '1-646-361-471', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(101, 'Rosalee Langosh', 'user99@example.com', '1', 1, '$2y$10$.2LcUFS0rByZCg8XGAU0Be6fW2pfmvR47c/dB.pgPjjdBAIedZ6hG', '(856) 241-240', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32'),
(102, 'Laurie Streich', 'user100@example.com', '1', 1, '$2y$10$j88XeX07Peth80HzsKrEtebHKVswbgeGg6joies1bgUweT2JiAAVO', '+1-463-854-92', NULL, '2024-11-28 03:52:32', '2024-11-28 03:52:32');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `image_products`
--
ALTER TABLE `image_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_products_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `image_products`
--
ALTER TABLE `image_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `image_products`
--
ALTER TABLE `image_products`
  ADD CONSTRAINT `image_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
