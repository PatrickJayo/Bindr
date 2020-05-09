
-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
                            `c_id` bigint(50) auto_increment primary key,
                            `c_author_id` bigint(11) NOT NULL,
                            `c_post_id` bigint(11) NOT NULL,
                            `c_content` varchar(10000) NOT NULL,
                            `c_edited` int(11) NOT NULL DEFAULT 0,
                            `c_time_edited` varchar(100) NOT NULL DEFAULT '0',
                            `c_time` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
                          `id` bigint(11) auto_increment primary key,
                          `uf_one` bigint(11) NOT NULL,
                          `uf_two` bigint(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
                         `id` bigint(11) auto_increment primary key,
                         `liker` bigint(11) NOT NULL,
                         `post_id` bigint(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
                            `id` int(11) auto_increment primary key,
                            `m_id` bigint(11) NOT NULL,
                            `message` varchar(1538) NOT NULL,
                            `m_from` bigint(11) NOT NULL,
                            `m_to` bigint(11) NOT NULL,
                            `m_time` int(11) NOT NULL,
                            `m_seen` int(11) NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table `mynotepad`
--

CREATE TABLE `mynotepad` (
                             `main_id` int(11) auto_increment primary key,
                             `id` bigint(20) NOT NULL,
                             `author_id` bigint(11) NOT NULL,
                             `note_title` varchar(1000) NOT NULL,
                             `note_content` varchar(10000) NOT NULL,
                             `note_time` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
                                 `id` int(11) auto_increment primary key,
                                 `n_id` bigint(11) NOT NULL,
                                 `from_id` bigint(11) NOT NULL,
                                 `for_id` bigint(11) NOT NULL,
                                 `notifyType_id` bigint(11) NOT NULL,
                                 `notifyType` varchar(100) NOT NULL,
                                 `seen` int(11) NOT NULL DEFAULT 0,
                                 `time` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
                          `id` bigint(11) auto_increment primary key,
                          `u_id` bigint(11) NOT NULL,
                          `p_id` bigint(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

CREATE TABLE `saved` (
                         `main_id` int(11) auto_increment primary key,
                         `id` bigint(20) NOT NULL,
                         `post_id` bigint(11) NOT NULL,
                         `user_saved_id` bigint(11) NOT NULL,
                         `saved_time` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
                          `main_id` int(11) auto_increment primary key,
                          `id` bigint(50) NOT NULL,
                          `Fullname` varchar(1000) NOT NULL,
                          `Username` varchar(1000) NOT NULL,
                          `Email` varchar(1000) NOT NULL,
                          `Password` varchar(1000) NOT NULL,
                          `followers` int(100) NOT NULL DEFAULT 0,
                          `Userphoto` varchar(300) NOT NULL,
                          `user_cover_photo` varchar(300) DEFAULT NULL,
                          `school` varchar(1000) DEFAULT NULL,
                          `work` varchar(1000) DEFAULT NULL,
                          `work0` varchar(1000) DEFAULT NULL,
                          `country` varchar(1000) DEFAULT NULL,
                          `birthday` varchar(1000) DEFAULT NULL,
                          `verify` int(11) NOT NULL DEFAULT 0,
                          `website` varchar(1000) DEFAULT NULL,
                          `bio` varchar(1000) DEFAULT NULL,
                          `admin` varchar(50) DEFAULT NULL,
                          `gender` varchar(1000) NOT NULL,
                          `login_attempts` int(11) DEFAULT 0,
                          `language` varchar(100) DEFAULT NULL,
                          `aSetup` int(11) NOT NULL DEFAULT 0,
                          `online` int(100) NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table `supportbox`
--

CREATE TABLE `supportbox` (
                              `id` int(11) auto_increment primary key,
                              `r_id` bigint(11) NOT NULL,
                              `from_id` bigint(11) NOT NULL,
                              `for_id` bigint(11) NOT NULL,
                              `r_type` varchar(100) NOT NULL,
                              `subject` varchar(1000) NOT NULL,
                              `report` varchar(1000) NOT NULL,
                              `r_time` int(11) NOT NULL,
                              `r_replay` varchar(1000) DEFAULT NULL,
                              `r_replay_time` int(11) DEFAULT NULL,
                              `status` int(11) NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Table structure for table `typing_m`
--

CREATE TABLE `typing_m` (
                            `id` bigint(11) auto_increment primary key,
                            `t_from` bigint(11) NOT NULL,
                            `t_to` bigint(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `wpost`
--

CREATE TABLE `wpost` (
                         `post_id` bigint(50) auto_increment primary key,
                         `author_id` bigint(11) NOT NULL,
                         `post_img` varchar(1000) DEFAULT NULL,
                         `post_time` int(11) NOT NULL,
                         `post_content` mediumtext NOT NULL,
                         `p_title` varchar(1000) DEFAULT NULL,
                         `p_likes` int(100) NOT NULL DEFAULT 0,
                         `p_privacy` int(11) NOT NULL DEFAULT 0,
                         `shared` varchar(1000) DEFAULT NULL
);

