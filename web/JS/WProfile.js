// ========================================
// WProfileForE.js
// ========================================

document.addEventListener("DOMContentLoaded", function () {

    // ========================================
    // Bio Character Counter
    // ========================================

    const bio = document.getElementById("bio");
    const counter = document.getElementById("count");

    if (bio && counter) {

        counter.innerText = bio.value.length;

        bio.addEventListener("input", function () {

            let length = bio.value.length;

            counter.innerText = length;

            if (length < 250) {

                counter.style.color = "#777777";

            }
            else if (length < 290) {

                counter.style.color = "#E67E22";

            }
            else {

                counter.style.color = "#E74C3C";

            }

        });

    }

    // ========================================
    // Form Validation
    // ========================================

    const form = document.querySelector("form");

    if (form) {

        form.addEventListener("submit", function (e) {

            const occupation =
                    document.querySelector(".profile-select");

            const experience =
                    document.querySelector(".profile-input");

            if (occupation.value === "") {

                alert("Please select your occupation.");

                occupation.focus();

                e.preventDefault();

                return;

            }

            if (experience.value.trim() === "") {

                alert("Please enter your experience.");

                experience.focus();

                e.preventDefault();

                return;

            }

            if (parseInt(experience.value) < 0) {

                alert("Experience cannot be negative.");

                experience.focus();

                e.preventDefault();

                return;

            }

            if (parseInt(experience.value) > 50) {

                alert("Experience cannot be greater than 50 years.");

                experience.focus();

                e.preventDefault();

                return;

            }

            if (bio.value.length > 300) {

                alert("Bio cannot exceed 300 characters.");

                bio.focus();

                e.preventDefault();

                return;

            }

        });

    }

});