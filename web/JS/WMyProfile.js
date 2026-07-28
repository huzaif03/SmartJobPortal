/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

 /* ============================================================
           Generic helpers reused by every editable section
           ============================================================ */
        function enterEdit(viewEl, editEl, editBtn, focusEl) {
            viewEl.hidden = true;
            editEl.hidden = false;
            editBtn.hidden = true;
            if (focusEl) focusEl.focus();
        }

        function exitEdit(viewEl, editEl, editBtn) {
            editEl.hidden = true;
            viewEl.hidden = false;
            editBtn.hidden = false;
        }

        /* ============================================================
           Personal Information — Gender & DOB only (Phone/Email locked)
           ============================================================ */
        const personalEditBtn = document.getElementById('personal-edit-btn');
        const personalView = document.getElementById('personal-view');
        const personalEditBox = document.getElementById('personal-edit');
        const personalFeedback = document.getElementById('personal-feedback');
        const personalSaveBtn = document.getElementById('personal-save-btn');
        const personalCancelBtn = document.getElementById('personal-cancel-btn');

        const genderView = document.getElementById('personal-gender');
        const genderInput = document.getElementById('gender-input');
        const dobView = document.getElementById('personal-dob');
        const dobInput = document.getElementById('dob-input');

        // "27/02/2002" <-> "2002-02-27" (the <input type="date"> format)
        function displayDateToInputDate(display) {
            const parts = display.split('/');
            if (parts.length !== 3) return '';
            const [dd, mm, yyyy] = parts;
            return `${yyyy}-${mm.padStart(2, '0')}-${dd.padStart(2, '0')}`;
        }

        function inputDateToDisplayDate(inputVal) {
            const parts = inputVal.split('-');
            if (parts.length !== 3) return inputVal;
            const [yyyy, mm, dd] = parts;
            return `${dd}/${mm}/${yyyy}`;
        }

        personalEditBtn.addEventListener('click', () => {
            genderInput.value = genderView.textContent.trim();
            dobInput.value = displayDateToInputDate(dobView.textContent.trim());
            personalFeedback.textContent = '';
            personalFeedback.className = 'section-feedback';
            enterEdit(personalView, personalEditBox, personalEditBtn, genderInput);
        });

        personalCancelBtn.addEventListener('click', () => {
            exitEdit(personalView, personalEditBox, personalEditBtn);
        });

        personalSaveBtn.addEventListener('click', () => {
            if (!dobInput.value) {
                personalFeedback.textContent = 'Please select your date of birth.';
                personalFeedback.className = 'section-feedback error';
                dobInput.focus();
                return;
            }

            // TODO: replace with a real save call, e.g.
            // fetch('updatePersonalInfo', {
            //     method: 'POST',
            //     headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            //     body: new URLSearchParams({ gender: genderInput.value, dob: dobInput.value })
            // })
            genderView.textContent = genderInput.value;
            dobView.textContent = inputDateToDisplayDate(dobInput.value);

            personalFeedback.textContent = 'Personal information updated.';
            personalFeedback.className = 'section-feedback success';
            setTimeout(() => exitEdit(personalView, personalEditBox, personalEditBtn), 700);
        });

        /* ============================================================
           Worker Profile — Occupation, Experience, Availability, Bio
           ============================================================ */
        const workerEditBtn = document.getElementById('worker-edit-btn');
        const workerView = document.getElementById('worker-view');
        const workerEditBox = document.getElementById('worker-edit-section');
        const workerFeedback = document.getElementById('worker-feedback');
        const workerSaveBtn = document.getElementById('worker-save-btn');
        const workerCancelBtn = document.getElementById('worker-cancel-btn');

        const occupationView = document.getElementById('worker-occupation');
        const occupationInput = document.getElementById('occupation-input');
        const experienceView = document.getElementById('worker-experience');
        const experienceInput = document.getElementById('experience-input');
        const availabilityView = document.getElementById('worker-availability');
        const bioView = document.getElementById('worker-bio');
        const bioInput = document.getElementById('bio-input');

        workerEditBtn.addEventListener('click', () => {
            occupationInput.value = occupationView.textContent.trim();
            experienceInput.value = parseInt(experienceView.textContent, 10) || '';
            bioInput.value = bioView.textContent.trim();

            const currentAvailability = availabilityView.textContent.trim();
            document.getElementById(currentAvailability === 'Available' ? 'avail-yes' : 'avail-no').checked = true;

            workerFeedback.textContent = '';
            workerFeedback.className = 'section-feedback';
            enterEdit(workerView, workerEditBox, workerEditBtn, occupationInput);
        });

        workerCancelBtn.addEventListener('click', () => {
            exitEdit(workerView, workerEditBox, workerEditBtn);
        });

        workerSaveBtn.addEventListener('click', () => {
            const experienceVal = experienceInput.value.trim();
            const selectedAvailability = document.querySelector('input[name="availability-radio"]:checked');

            if (!experienceVal) {
                workerFeedback.textContent = 'Please enter your years of experience.';
                workerFeedback.className = 'section-feedback error';
                experienceInput.focus();
                return;
            }
            if (!selectedAvailability) {
                workerFeedback.textContent = 'Please select your availability status.';
                workerFeedback.className = 'section-feedback error';
                return;
            }

            // TODO: replace with a real save call, e.g.
            // fetch('updateWorkerProfile', {
            //     method: 'POST',
            //     headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            //     body: new URLSearchParams({
            //         occupation: occupationInput.value,
            //         exp: experienceVal,
            //         isAvailable: selectedAvailability.value,
            //         bio: bioInput.value
            //     })
            // })
            occupationView.textContent = occupationInput.value;
            experienceView.textContent = `${experienceVal} years`;
            availabilityView.textContent = selectedAvailability.value;
            availabilityView.classList.toggle('is-unavailable', selectedAvailability.value !== 'Available');
            bioView.textContent = bioInput.value;

            workerFeedback.textContent = 'Worker profile updated.';
            workerFeedback.className = 'section-feedback success';
            setTimeout(() => exitEdit(workerView, workerEditBox, workerEditBtn), 700);
        });

        /* ============================================================
           Address — Street, City, State, Zip Code, Country
           ============================================================ */
        const addressEditBtn = document.getElementById('address-edit-btn');
        const addressView = document.getElementById('address-view');
        const addressEditBox = document.getElementById('address-edit');
        const addressSaveBtn = document.getElementById('address-save-btn');
        const addressCancelBtn = document.getElementById('address-cancel-btn');
        const addressFeedback = document.getElementById('address-feedback');

        const addressFields = [{
            key: 'street',
            view: document.getElementById('address-street'),
            input: document.getElementById('street-input')
        }, {
            key: 'city',
            view: document.getElementById('address-city'),
            input: document.getElementById('city-input')
        }, {
            key: 'state',
            view: document.getElementById('address-state'),
            input: document.getElementById('state-input')
        }, {
            key: 'zip_code',
            view: document.getElementById('address-zip'),
            input: document.getElementById('zip-input')
        }, {
            key: 'country',
            view: document.getElementById('address-country'),
            input: document.getElementById('country-input')
        }];

        addressEditBtn.addEventListener('click', () => {
            addressFields.forEach(f => f.input.value = f.view.textContent.trim());
            addressFeedback.textContent = '';
            addressFeedback.className = 'section-feedback';
            enterEdit(addressView, addressEditBox, addressEditBtn, addressFields[0].input);
        });

        addressCancelBtn.addEventListener('click', () => {
            exitEdit(addressView, addressEditBox, addressEditBtn);
        });

        addressSaveBtn.addEventListener('click', () => {
            const values = {};
            let firstEmpty = null;

            for (const f of addressFields) {
                const val = f.input.value.trim();
                if (!val && !firstEmpty) firstEmpty = f.input;
                values[f.key] = val;
            }

            if (firstEmpty) {
                addressFeedback.textContent = 'Please fill in all address fields.';
                addressFeedback.className = 'section-feedback error';
                firstEmpty.focus();
                return;
            }

            if (!/^[0-9A-Za-z\- ]{3,10}$/.test(values.zip_code)) {
                addressFeedback.textContent = 'Enter a valid zip code.';
                addressFeedback.className = 'section-feedback error';
                document.getElementById('zip-input').focus();
                return;
            }

            // TODO: replace with a real save call matching the address table columns, e.g.
            // fetch('updateAddress', {
            //     method: 'POST',
            //     headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            //     body: new URLSearchParams(values)
            // })
            addressFields.forEach(f => f.view.textContent = values[f.key]);
            addressFeedback.textContent = 'Address updated successfully.';
            addressFeedback.className = 'section-feedback success';

            setTimeout(() => exitEdit(addressView, addressEditBox, addressEditBtn), 700);
        });


