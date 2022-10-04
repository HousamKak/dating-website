// Global pages navigation
//////////////////////////////////////////////////////////////////
FEED = document.getElementById("FEED");
FAVORITES = document.getElementById("FAVORITES");
CHAT = document.getElementById("CHAT");
PROFILE = document.getElementById("PROFILE");

FEED.addEventListener("click", () => {
  window.location.href = "/html pages/feed.html";
});
FAVORITES.addEventListener("click", () => {
  window.location.href = "/html pages/favorites.html";
});
CHAT.addEventListener("click", () => {
  window.location.href = "/html pages/chat.html";
});
PROFILE.addEventListener("click", () => {
  window.location.href = "/html pages/profile.html";
});
//////////////////////////////////////////////////////////////
