console.log('js is connected!!!');

//FETCH BUTTON
const fetchButton = document.getElementById('fetch-button'); // random dog button
const galleryButton = document.getElementById('gallery-button'); // gallery button
const dogImage = document.getElementById('dog-image'); //finds image
const dogGallery = document.getElementById('dogGallery'); //storage for images 
const clearButton = document.getElementById('clearGallery'); //storage for images 

let dogImages = JSON.parse(localStorage.getItem('dogGallery')) || []; //ARRAY
const saveDogImages = () => {
  localStorage.setItem("dogGallery", JSON.stringify(dogImages));
}; // Save to local storage

let galleryVisible = false; //gallery button "switch" from gallery visible (true) to hidden (false)

//Kinute button functions
fetchButton.addEventListener('click', async () => {
  try {
    fetchButton.disabled = true;
    fetchButton.textContent = 'Loading...'

    const response = await fetch('https://dog.ceo/api/breeds/image/random');

    if (!response.ok) {
      throw new Error(`HTTP error. Status: ${response.error}`);
    }

    const data = await response.json();
    dogImage.src = data.message; //picture 
    addImage = dogImage.src; //variable to put into dogImages.push(addImage);

    dogImages.push(addImage); //adds URL into array 
    saveDogImages();

  } catch (error) {
    console.log('Error', error);
  } finally {
    fetchButton.disabled = false; //reenables button
    fetchButton.textContent = "Click for a Kiñute Galågu!";
  }
});

galleryButton.addEventListener('click', async () => {
  try {
    galleryButton.disabled = true;
    galleryButton.textContent = 'Loading...'

    galleryVisible = !galleryVisible; // switches the gallery visibility when clicked

    if (galleryVisible) {
      const savedImages = JSON.parse(localStorage.getItem("dogGallery")) || [];

      if (savedImages.length === 0) {
        dogGallery.textContent = "Tåya kiñute galågu siha!";
      } else {
        const galleryHtml = savedImages
          .map(url => `<img src="${url}" style="max-width:150px; margin:10px;">`)
          .join('');

        dogGallery.innerHTML = galleryHtml; // shows gallery 
      }
      dogGallery.style.display = "block";
      galleryButton.textContent = "Close Gallery"; //changes button to close gallery
    } else {
      dogGallery.innerHTML = ''; //clears content
      dogGallery.textContent = ''; // clears messages
      dogGallery.style.display = "none"; //hides gallery
      galleryButton.textContent = "Baba i Gallery";
    }

  } catch (error) {
    console.log('Error', error);
  } finally {
    galleryButton.disabled = false; //reenables button
  }

});

clearButton.addEventListener('click', async () => {
  try {
    dogImages = []; //resets js array
    saveDogImages(); //updates local storage with empty array 

    dogGallery.innerHTML = ''; //clear the gallery 
    dogGallery.style.display = "none"; //hides gallery

    galleryButton.textContent = "Baba i Gallery";
    galleryVisible = false; //resets to default

    alert("Gallery has been cleared");

  } catch (error) {
    console.log('Error', error);
  } finally {
    clearButton.disabled = false; //reenables button
  }
});
