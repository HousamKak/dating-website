// Global pages navigation
//////////////////////////////////////////////////////////////////
FEED = document.getElementById("FEED");
FAVORITES = document.getElementById("FAVORITES");
CHAT = document.getElementById("CHAT");
PROFILE = document.getElementById("PROFILE");

FEED.addEventListener("click", () => {
  window.location.href = "/frontend/feed.html";
});
FAVORITES.addEventListener("click", () => {
  window.location.href = "/frontend/favorites.html";
});
CHAT.addEventListener("click", () => {
  window.location.href = "/frontend/chat.html";
});
PROFILE.addEventListener("click", () => {
  window.location.href = "/frontend/profile.html";
});
//////////////////////////////////////////////////////////////
