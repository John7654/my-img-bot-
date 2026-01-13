<?php
// --- কনফিগারেশন ---
define('API_TOKEN', '8388289991:AAFVrfqwp5hGJwa27yQ8CtzvPsYqkLxlUbo');
define('IMGBB_API_KEY', '33d5d794e147140f21c22a22a392669b');
define('ADMIN_ID', '6973940391'); // তোমার দেওয়া আইডি এখানে বসানো হয়েছে

// ডাটাবেস সেটআপ (ইউজার ট্র্যাক করার জন্য)
$db = new SQLite3('users.db');
$db->exec("CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY, chat_id INTEGER UNIQUE)");

$update = json_decode(file_get_contents("php://input"), true);
if (!$update) exit;

$message = $update['message'] ?? null;
$chatId = $message['chat']['id'] ?? null;
$text = $message['text'] ?? '';
$photo = $message['photo'] ?? null;

// নতুন ইউজার ডাটাবেসে সেভ করা
if ($chatId) {
    $stmt = $db->prepare("INSERT OR IGNORE INTO users (chat_id) VALUES (:chat_id)");
    $stmt->bindValue(':chat_id', $chatId, SQLITE3_INTEGER);
    $stmt->execute();
}

// --- কমান্ডসমূহ ---

// ১. স্টার্ট কমান্ড
if ($text == '/start') {
    $welcomeMsg = "<b>🚀 Tech Master Image Hosting Bot</b>\n\n"
                . "স্বাগতম! আমি আপনার ছবিকে সরাসরি লিংকে রূপান্তর করতে পারি।\n\n"
                . "📸 <b>ব্যবহারের নিয়ম:</b> যেকোনো ছবি আমাকে পাঠান।";
    
    $keyboard = [
        'inline_keyboard' => [
            [['text' => '👤 Developer', 'url' => 'https://t.me/GAJARBOTOLZ']],
            [['text' => '📢 Main Channel', 'url' => 'https://t.me/tech_master_a2z']]
        ]
    ];
    sendMessage($chatId, $welcomeMsg, json_encode($keyboard));
}

// ২. স্ট্যাটাস কমান্ড (শুধুমাত্র তোমার জন্য কাজ করবে)
elseif ($text == '/status' && $chatId == ADMIN_ID) {
    $res = $db->querySingle("SELECT COUNT(*) FROM users");
    sendMessage($chatId, "📊 <b>বট স্ট্যাটাস:</b>\n\nমোট ইউজার সংখ্যা: <code>$res</code> জন।");
}

// --- ফটো হ্যান্ডলিং ---
elseif ($photo) {
    // আপলোডিং স্ট্যাটাস দেখানো
    $waitMsg = sendMessage($chatId, "⏳ <i>আপনার ছবিটি আপলোড হচ্ছে, দয়া করে অপেক্ষা করুন...</i>");
    $waitMsgId = $waitMsg['result']['message_id'];

    $photoId = end($photo)['file_id'];
    $fileInfo = json_decode(file_get_contents("https://api.telegram.org/bot".API_TOKEN."/getFile?file_id=$photoId"), true);
    $filePath = $fileInfo['result']['file_path'];
    $photoUrl = "https://api.telegram.org/file/bot".API_TOKEN."/$filePath";

    // ImgBB API এর মাধ্যমে আপলোড
    $uploadedUrl = uploadToImgBB($photoUrl);

    if ($uploadedUrl) {
        $finalMsg = "<b>✅ সফলভাবে আপলোড হয়েছে!</b>\n\n"
                  . "🔗 <b>সরাসরি লিংক:</b> <code>$uploadedUrl</code>\n\n"
                  . "🛰 <i>বটটি ভালো লাগলে শেয়ার করুন!</i>";
        
        $btn = ['inline_keyboard' => [[['text' => '🌐 Open Image', 'url' => $uploadedUrl]]]];

        // আগের মেসেজ ডিলিট করে লিংক পাঠানো
        deleteMessage($chatId, $waitMsgId);
        sendMessage($chatId, $finalMsg, json_encode($btn));
    } else {
        sendMessage($chatId, "❌ দুঃখিত! ফাইলটি আপলোড করা সম্ভব হয়নি।");
    }
}

// --- দরকারি ফাংশনসমূহ ---
function sendMessage($chatId, $text, $keyboard = null) {
    $url = "https://api.telegram.org/bot".API_TOKEN."/sendMessage";
    $data = ['chat_id' => $chatId, 'text' => $text, 'parse_mode' => 'HTML', 'reply_markup' => $keyboard];
    return postCurl($url, $data);
}

function deleteMessage($chatId, $msgId) {
    $url = "https://api.telegram.org/bot".API_TOKEN."/deleteMessage";
    return postCurl($url, ['chat_id' => $chatId, 'message_id' => $msgId]);
}

function uploadToImgBB($imageUrl) {
    $ch = curl_init("https://api.imgbb.com/1/upload?key=".IMGBB_API_KEY);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, ['image' => $imageUrl]);
    $res = json_decode(curl_exec($ch), true);
    curl_close($ch);
    return $res['data']['url'] ?? null;
}

function postCurl($url, $data) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    $res = curl_exec($ch);
    curl_close($ch);
    return json_decode($res, true);
}
?>
