// navigator.geolocation.getCurrentPosition(showPosition);
const dating_pages = {};
dating_pages.logout = document.getElementById("LOGOUT");
dating_pages.baseURL = "http://127.0.0.1:8000/api";

dating_pages.loadFor = (page) => {
  eval("dating_pages.load_" + page + "();");
};

dating_pages.load_landing = () => {
  // Get the signup button
  const SIGNUP = document.getElementById("SIGNUP");

  // Storing the location
  navigator.geolocation.getCurrentPosition(success, error, options);
  const y_pos = localStorage.getItem("Latitude");
  const x_pos = localStorage.getItem("Longitude");
  const pos = [x_pos, y_pos];
  const pos_json = JSON.stringify(pos);

  // Get the signup input fields
  const FAV_GENDER = document.getElementById("FAV-GENDER");
  const NAME = document.getElementById("NAME");
  const EMAIL = document.getElementById("EMAIL");
  const AGE = document.getElementById("AGE");
  const GENDER = document.getElementById("GENDER");
  const PASSWORD = document.getElementById("PASSWORD");
  const IN_EMAIL = document.getElementById("IN-EMAIL");
  const IN_PASSWORD = document.getElementById("IN-PASSWORD");
  const LOGIN = document.getElementById("LOGIN");

  // Listen to the signup click
  SIGNUP.addEventListener("click", () => {
    const signup_url = dating_pages.baseURL + "/signup";
    const signup_message = document.getElementById("signup-message");
    const params = new URLSearchParams();
    params.append("name", NAME.value);
    params.append("email", EMAIL.value);
    params.append("age", AGE.value);
    params.append("gender", GENDER.options[GENDER.selectedIndex].value);
    params.append(
      "favorite_gender",
      FAV_GENDER.options[FAV_GENDER.selectedIndex].value
    );
    params.append("password", PASSWORD.value);
    axios({ method: "post", url: signup_url, data: params }).then((object) => {
      if (object.data.result == "email already registered") {
        signup_message.textContent = "email already registered";
      } else if (object.data.result == "invalid email") {
        signup_message.textContent = "invalid email";
      } else {
        signup_message.textContent = "Registration succeeded Please log In";
      }
    });
  });

  // Listen to sign in click
  LOGIN.addEventListener("click", () => {
    const signin_url = dating_pages.baseURL + "/signin";
    const signin_params = new URLSearchParams();
    signin_params.append("email", IN_EMAIL.value);
    signin_params.append("password", IN_PASSWORD.value);
    signin_params.append("location", pos_json);
    const signin_message = document.getElementById("signin-message");
    axios({ method: "post", url: signin_url, data: signin_params }).then(
      (object) => {
        x = "Sign in: ";
        if (object.data.result == "invalid email") {
          signin_message.textContent = x + "invalid email";
        } else if (object.data.result == "invalid password") {
          signin_message.textContent = x + "invalid password";
        } else if (object.data.result == "email not registered") {
          signin_message.textContent = x + "email not registered";
        } else {
          window.location.href = "/html pages/feed.html";
          localStorage.setItem(
            "user_id",
            JSON.stringify(object.data.result.user_id)
          );
          localStorage.setItem(
            "fav_gender",
            JSON.stringify(object.data.result.favorite_gender)
          );
          localStorage.setItem("location", object.data.result.location);
        }
      }
    );
  });
};

dating_pages.load_profile = () => {
  // logging out
  dating_pages.logout.addEventListener("click", () => {
    logOut();
  });

  const user_id = JSON.parse(localStorage.getItem("user_id"));
  const user_info_url = dating_pages.baseURL + "/user/info";
  const profile_params = new URLSearchParams();
  profile_params.append("user_id", user_id);

  // write to
  const write_name = document.getElementById("write-name");
  const write_email = document.getElementById("write-email");
  const write_age = document.getElementById("write-age");
  const write_gender = document.getElementById("write-gender");
  const write_favgender = document.getElementById("write-favgender");
  const write_profile = document.getElementById("PROFILE-PHOTO");
  const write_location = document.getElementById("write-location");
  const write_bio = document.getElementById("write-bio");

  axios({ method: "post", url: user_info_url, data: profile_params }).then(
    (object) => {
      write_name.textContent = object.data.result.name;
      write_email.textContent = object.data.result.email;
      write_age.textContent = object.data.result.age;
      write_gender.textContent = object.data.result.gender;
      write_favgender.textContent = object.data.result.favorite_gender;
      write_location.textContent =
        "You are here: " + object.data.result.location;
      write_profile.src = object.data.result.picture;
      write_bio.textContent = object.data.result.bio;
    }
  );

  // get from
  const profile_name = document.getElementById("PROFILE-NAME");
  const profile_photo_path = document.getElementById("PROFILE-PHOTO-path");
  const profile_age = document.getElementById("PROFILE-AGE");
  const profile_gender = document.getElementById("PROFILE-GENDER");
  const profile_bio = document.getElementById("PROFILE-BIO");
  const profile_favgender = document.getElementById("PROFILE-FAVGENDER");
  const update_profile = document.getElementById("UPDATE-PROFILE");
  const update_profile_url = dating_pages.baseURL + "/user/update";

  // encoding the image
  let image = "";
  const getImage = () => {
    let file = profile_photo_path["files"][0];
    let reader = new FileReader();
    reader.onload = function () {
      image = reader.result.replace("data:", "").replace(/^.+,/, "");
    };
    reader.readAsDataURL(file);
  };

  profile_photo_path.addEventListener("change", getImage);
  update_profile.addEventListener("click", () => {
    // Collecting the needed input parameters
    const new_profile_params = new URLSearchParams();
    new_profile_params.append("user_id", user_id);
    new_profile_params.append("name", profile_name.value);
    console.log(image);
    new_profile_params.append("picture", image);
    new_profile_params.append("age", profile_age.value);
    new_profile_params.append("favorite_gender", profile_favgender.value);
    new_profile_params.append("bio", profile_bio.value);

    // Posting to the database
    axios({
      method: "post",
      url: update_profile_url,
      data: new_profile_params,
    }).then((object) => {
      console.log(object.data);
      write_profile.src = object.data.result;
    });

    // Writing in the document
    write_name.textContent = profile_name.value;
    write_age.textContent = profile_age.value;
    write_gender.textContent = profile_gender.value;
    write_bio.textContent = profile_bio.value;
    window.location.reload();
  });
};

dating_pages.load_feed = () => {
  const user_id = JSON.parse(localStorage.getItem("user_id"));
  const favor_gender = JSON.parse(localStorage.getItem("fav_gender"));
  const mylocation = JSON.parse(localStorage.getItem("location"));
  const feed_url = dating_pages.baseURL + "/feed";
  // logging out
  dating_pages.logout.addEventListener("click", () => {
    logOut();
  });

  // Parameters
  const feed_params = new URLSearchParams();
  feed_params.append("user_id", user_id);
  feed_params.append("favorite_gender", favor_gender);
  // Posting to the database
  axios({
    method: "post",
    url: feed_url,
    data: feed_params,
  }).then((object) => {
    localStorage.setItem("people", JSON.stringify(object.data.result));
  });

  // Now sort the data from closest to furthest
  peopleArray = JSON.parse(localStorage.getItem("people"));
  for (let i = 0; i < peopleArray.length; i++) {
    // calcCrow(lat1, lon1, lat2, lon2);
    // y is latitude
    peopleArray[i].order = calcCrow(
      mylocation[1],
      mylocation[0],
      JSON.parse(peopleArray[i].location)[1],
      JSON.parse(peopleArray[i].location)[0]
    );
  }
  // Sort the array from closest to furthest
  peopleArray.sort((a, b) => a.order - b.order);
  const all_people = document.getElementById("ALL-PEOPLE");
  let people = "";
  for (let i = 0; i < peopleArray.length; i++) {
    const person = `<div class="person-card">
    <img id="${peopleArray[i].user_id}-img" src="${peopleArray[i].picture}" />
    <p>name: <span>${peopleArray[i].name}</span></p>
    <p>age: <span>${peopleArray[i].age}</span></p>
    <p>gender: <span></span>${peopleArray[i].gender}</p>
    <p>bio: <span>${peopleArray[i].bio}</span></p>
    <div class="person-buttons">
      <button>favorite</button>
      <button>chat</button>
      <button>block</button>
    </div>
  </div>`;
    people += person;
  }
  console.log(people);
  all_people.innerHTML += people;
};

dating_pages.load_chat = () => {
  // logging out
  dating_pages.logout.addEventListener("click", () => {
    logOut();
  });
};
dating_pages.load_favorites = () => {
  // logging out
  dating_pages.logout.addEventListener("click", () => {
    logOut();
  });
};

// logging out
function logOut() {
  localStorage.removeItem("user_id");
  window.location.href = "/html pages/landingpage.html";
}

// getting position
////////////////////////////////////////////
const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0,
};

function success(pos) {
  const crd = pos.coords;
  localStorage.setItem("Latitude", crd.latitude);
  localStorage.setItem("Longitude", crd.longitude);
}

function error(err) {}
////////////////////////////////////////////////////////////

// finding distance between two points on earth

function calcCrow(lat1, lon1, lat2, lon2) {
  var R = 6371; // km
  var dLat = toRad(lat2 - lat1);
  var dLon = toRad(lon2 - lon1);
  var lat1 = toRad(lat1);
  var lat2 = toRad(lat2);

  var a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c;
  return d;
}

// Converts numeric degrees to radians
function toRad(Value) {
  return (Value * Math.PI) / 180;
}
