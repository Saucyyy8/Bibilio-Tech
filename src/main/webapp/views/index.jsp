<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RNSIT Library</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .hero-pattern {
            background: linear-gradient(rgba(30, 64, 175, 0.9), rgba(30, 64, 175, 0.9)), url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="bg-gray-50">

    <nav class="bg-blue-900 text-white shadow-lg">
        <div class="container mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <a href="#" class="text-2xl font-bold">RNSIT LIBRARY</a>

                <div class="hidden md:flex space-x-8">
                    <a href="#" id="home-link" class="hover:text-blue-200 transition duration-300">Home</a>
                    <a href="#" id="catalog-link" class="hover:text-blue-200 transition duration-300">Catalog</a>
                    <a href="#" id="events-link" class="hover:text-blue-200 transition duration-300">Events</a>
                    <a href="#" id="about-link" class="hover:text-blue-200 transition duration-300">About</a>
                    <a href="#" id="contact-link" class="hover:text-blue-200 transition duration-300">Contact</a>
                </div>


                <button id="mobile-menu-button" class="md:hidden">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                </button>
            </div>


            <div id="mobile-menu" class="hidden md:hidden pb-4">
                <a href="#" id="mobile-home-link" class="block py-2 hover:text-blue-200 transition duration-300">Home</a>
                <a href="#" id="mobile-catalog-link" class="block py-2 hover:text-blue-200 transition duration-300">Catalog</a>
                <a href="#" id="mobile-events-link" class="block py-2 hover:text-blue-200 transition duration-300">Events</a>
                <a href="#" id="mobile-about-link" class="block py-2 hover:text-blue-200 transition duration-300">About</a>
                <a href="#" id="mobile-contact-link" class="block py-2 hover:text-blue-200 transition duration-300">Contact</a>
            </div>
        </div>
    </nav>

    <div id="main-content">

        <section id="home-section" class="hero-pattern text-white py-16">
            <div class="container mx-auto px-4">
                <div class="max-w-3xl mx-auto text-center">
                    <h1 class="text-4xl md:text-5xl font-bold mb-6">Discover, Learn, and Grow</h1>
                    <p class="text-xl mb-8">Your gateway to knowledge and imagination. Explore our vast collection of books, resources, and community programs.</p>
                    <div class="flex flex-col md:flex-row justify-center space-y-4 md:space-y-0 md:space-x-4">
                        <a href="#" class="bg-white text-blue-800 hover:bg-blue-50 font-bold py-3 px-6 rounded-lg shadow-lg transition duration-300" id="browse-books-btn">Browse Books</a>
                        <a href="#" class="bg-transparent border-2 border-white hover:bg-white hover:text-blue-800 text-white font-bold py-3 px-6 rounded-lg transition duration-300" id="library-card-btn">Get a Library Card</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="bg-white py-10">
            <div class="container mx-auto px-4">
                <div class="max-w-3xl mx-auto">
                    <div class="bg-blue-50 rounded-lg p-6 shadow-md">
                        <h2 class="text-2xl font-bold text-blue-900 mb-4">Find Your Next Book</h2>
                        <div class="flex flex-col md:flex-row space-y-4 md:space-y-0 md:space-x-4">
                            <input type="text" id="search-input" placeholder="Search by title, author, or keyword" class="flex-grow px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <select id="category-select" class="px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                <option value="">All Categories</option>
                                <option value="fiction">Fiction</option>
                                <option value="non-fiction">Non-Fiction</option>
                                <option value="children">Children's</option>
                                <option value="science">Science & Technology</option>
                                <option value="history">History</option>
                            </select>
                            <button id="search-button" class="bg-blue-800 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg transition duration-300">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="catalog-section" class="py-12 bg-gray-50">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-bold text-blue-900 mb-2 text-center">Featured Books</h2>
                <p class="text-gray-600 mb-8 text-center">Explore our latest additions and popular titles</p>

                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                    <c:forEach items="${featuredBooks}" var="book">
                        <div class="book-card bg-white rounded-lg overflow-hidden shadow-md">
                            <div class="h-64 bg-blue-100 flex items-center justify-center">
                                <c:choose>
                                    <c:when test="${not empty book.imageUrl}">
                                        <img src="${book.imageUrl}" alt="${book.title}" class="h-full max-h-60 w-auto object-contain" />
                                    </c:when>
                                    <c:otherwise>
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 text-blue-800" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                                        </svg>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="p-5">
                                <span class="text-sm text-blue-600 font-semibold">${book.category}</span>
                                <h3 class="text-xl font-bold text-gray-800 mb-2">${book.title}</h3>
                                <p class="text-gray-600 mb-2">${book.author}</p>
                                <div class="flex items-center mb-4">
                                    <div class="flex text-yellow-400">
                                        <c:forEach begin="1" end="5" var="i">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ${i <= book.rating ? '' : 'text-gray-300'}" viewBox="0 0 20 20" fill="currentColor">
                                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                            </svg>
                                        </c:forEach>
                                    </div>
                                    <span class="text-gray-500 ml-2">(${book.reviewCount} reviews)</span>
                                </div>
                                <div class="flex justify-between items-center">
                                    <span class="text-${book.status == 'AVAILABLE' ? 'green' : book.status == 'ON_HOLD' ? 'yellow' : 'red'}-600 font-semibold">${book.status}</span>
                                    <a href="/books/${book.id}" class="bg-blue-800 hover:bg-blue-700 text-white px-4 py-2 rounded-lg text-sm font-medium">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="text-center mt-10">
                    <a href="/books" class="bg-blue-800 hover:bg-blue-700 text-white font-bold py-3 px-8 rounded-lg transition duration-300">View All Books</a>
                </div>
            </div>
        </section>

        <!-- Events Section -->
        <section id="events-section" class="py-12 bg-white">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-bold text-blue-900 mb-2 text-center">Upcoming Events</h2>
                <p class="text-gray-600 mb-8 text-center">Join us for exciting community events and activities</p>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <!-- Event 1 -->
                    <div class="bg-blue-50 rounded-lg overflow-hidden shadow-md">
                        <div class="p-6">
                            <div class="flex items-center mb-4">
                                <div class="bg-blue-800 text-white rounded-lg p-3 mr-4">
                                    <span class="block text-xl font-bold">15</span>
                                    <span class="block text-sm">JUN</span>
                                </div>
                                <div>
                                    <span class="block text-sm text-blue-600 font-semibold">10:00 AM - 12:00 PM</span>
                                    <h3 class="text-xl font-bold text-gray-800">Children's Story Time</h3>
                                </div>
                            </div>
                            <p class="text-gray-600 mb-4">Join us for a magical morning of storytelling and activities for children ages 3-8.</p>
                            <div class="flex items-center text-gray-500 mb-4">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                <span>Children's Section, Main Library</span>
                            </div>
                            <button class="w-full bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg transition duration-300">Register</button>
                        </div>
                    </div>

                    <!-- Event 2 -->
                    <div class="bg-blue-50 rounded-lg overflow-hidden shadow-md">
                        <div class="p-6">
                            <div class="flex items-center mb-4">
                                <div class="bg-blue-800 text-white rounded-lg p-3 mr-4">
                                    <span class="block text-xl font-bold">18</span>
                                    <span class="block text-sm">JUN</span>
                                </div>
                                <div>
                                    <span class="block text-sm text-blue-600 font-semibold">6:30 PM - 8:00 PM</span>
                                    <h3 class="text-xl font-bold text-gray-800">Book Club: The Alchemist</h3>
                                </div>
                            </div>
                            <p class="text-gray-600 mb-4">Join our monthly book club discussion on Paulo Coelho's "The Alchemist". New members welcome!</p>
                            <div class="flex items-center text-gray-500 mb-4">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                <span>Meeting Room B, Main Library</span>
                            </div>
                            <button class="w-full bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg transition duration-300">Register</button>
                        </div>
                    </div>

                    <!-- Event 3 -->
                    <div class="bg-blue-50 rounded-lg overflow-hidden shadow-md">
                        <div class="p-6">
                            <div class="flex items-center mb-4">
                                <div class="bg-blue-800 text-white rounded-lg p-3 mr-4">
                                    <span class="block text-xl font-bold">22</span>
                                    <span class="block text-sm">JUN</span>
                                </div>
                                <div>
                                    <span class="block text-sm text-blue-600 font-semibold">2:00 PM - 4:00 PM</span>
                                    <h3 class="text-xl font-bold text-gray-800">Digital Literacy Workshop</h3>
                                </div>
                            </div>
                            <p class="text-gray-600 mb-4">Learn essential computer skills in this beginner-friendly workshop. Bring your own device or use ours.</p>
                            <div class="flex items-center text-gray-500 mb-4">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                <span>Computer Lab, Main Library</span>
                            </div>
                            <button class="w-full bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg transition duration-300">Register</button>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-10">
                    <button class="bg-blue-800 hover:bg-blue-700 text-white font-bold py-3 px-8 rounded-lg transition duration-300">View All Events</button>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="about-section" class="py-12 bg-gray-50">
            <div class="container mx-auto px-4">
                <div class="max-w-4xl mx-auto">
                    <h2 class="text-3xl font-bold text-blue-900 mb-6 text-center">About Our Library</h2>

                    <div class="bg-white rounded-lg shadow-md overflow-hidden">
                        <div class="md:flex">
                            <div class="md:w-1/2 bg-blue-800 text-white p-8">
                                <h3 class="text-2xl font-bold mb-4">Our Mission</h3>
                                <p class="mb-4">To provide free and equal access to information, knowledge, and ideas; and to promote the enjoyment of reading, lifelong learning, and cultural enrichment for all.</p>

                                <h3 class="text-2xl font-bold mb-4 mt-8">Hours</h3>
                                <ul class="space-y-2">
                                    <li class="flex justify-between">
                                        <span>Monday to   Saturday</span>
                                        <span>8:00 AM - 11:00 PM</span>
                                    </li>
                                    <li class="flex justify-between">
                                        <span>Sunday</span>
                                        <span>1:00 PM - 5:00 PM</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="md:w-1/2 p-8">
                                <h3 class="text-2xl font-bold text-blue-900 mb-4">Our Services</h3>
                                <ul class="space-y-3">
                                    <li class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-800 mr-2 mt-1" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                        </svg>
                                        <span>Free book borrowing with a library card</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-800 mr-2 mt-1" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                        </svg>
                                        <span>Public computers and free Wi-Fi</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-800 mr-2 mt-1" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                        </svg>
                                        <span>Printing, scanning, and copying services</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-800 mr-2 mt-1" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                        </svg>
                                        <span>Study rooms and meeting spaces</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-800 mr-2 mt-1" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                        </svg>
                                        <span>Children's programs and activities</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-800 mr-2 mt-1" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                        </svg>
                                        <span>E-books and digital resources</span>
                                    </li>
                                </ul>

                                <div class="mt-8">
                                    <a href="#" class="inline-block bg-blue-800 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded-lg transition duration-300">Learn More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact-section" class="py-12 bg-white">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-bold text-blue-900 mb-2 text-center">Contact Us</h2>
                <p class="text-gray-600 mb-8 text-center">We're here to help with any questions you may have</p>

                <div class="max-w-4xl mx-auto">
                    <div class="bg-blue-50 rounded-lg shadow-md overflow-hidden">
                        <div class="md:flex">
                            <div class="md:w-1/2 p-8">
                                <h3 class="text-2xl font-bold text-blue-900 mb-4">Get In Touch</h3>

                                <form>
                                    <div class="mb-4">
                                        <label for="name" class="block text-gray-700 font-medium mb-2">Name</label>
                                        <input type="text" id="name" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    </div>
                                    <div class="mb-4">
                                        <label for="email" class="block text-gray-700 font-medium mb-2">Email</label>
                                        <input type="email" id="email" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    </div>
                                    <div class="mb-4">
                                        <label for="subject" class="block text-gray-700 font-medium mb-2">Subject</label>
                                        <input type="text" id="subject" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    </div>
                                    <div class="mb-6">
                                        <label for="message" class="block text-gray-700 font-medium mb-2">Message</label>
                                        <textarea id="message" rows="4" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                                    </div>
                                    <button type="button" id="send-message" class="w-full bg-blue-800 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg transition duration-300">Send Message</button>
                                </form>
                            </div>
                            <div class="md:w-1/2 bg-blue-800 text-white p-8">
                                <h3 class="text-2xl font-bold mb-4">Contact Information</h3>

                                <div class="space-y-4">
                                    <div class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3 mt-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                        <div>
                                            <h4 class="font-bold">Address</h4>
                                            <p>Dr. Vishnuvardhana Road Post, RNS Farms Rd, Channasandra, Rajarajeshwari Nagar, Bengaluru, Karnataka 560098</p>
                                        </div>
                                    </div>

                                    <div class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3 mt-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                        </svg>
                                        <div>
                                            <h4 class="font-bold">Phone</h4>
                                            <p>9148962263</p>
                                        </div>
                                    </div>

                                    <div class="flex items-start">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3 mt-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                        </svg>
                                        <div>
                                            <h4 class="font-bold">Email</h4>
                                            <p>suhasmadhu23is@rnsit.ac.in</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-8">
                                    <h4 class="font-bold mb-4">Follow Us</h4>
                                    <div class="flex space-x-4">
                                        <a href="https://www.instagram.com/saucyy8008/" target="_blank" class="bg-white text-blue-800 hover:bg-blue-100 rounded-full p-2 transition duration-300">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                                                <path d="M12 2C6.477 2 2 6.477 2 12c0 5.523 4.477 10 10 10s10-4.477 10-10c0-5.523-4.477-10-10-10zm4.957 7.571h-1.65c-.195 0-.413.257-.413.601v1.186h2.063l-.312 2.091h-1.75v6.142h-2.53v-6.142H10.39v-2.091h1.975v-1.012c0-1.736.984-2.685 2.852-2.685h1.74v1.91z"/>
                                            </svg>
                                        </a>
                                        <a href="mailto:suhasmadhu23is@rnsit.ac.in" class="bg-white text-blue-800 hover:bg-blue-100 rounded-full p-2 transition duration-300">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <footer class="bg-blue-900 text-white py-8">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div>
                    <h3 class="text-xl font-bold mb-4">RNSIT Library</h3>
                    <p class="mb-4">Your gateway to knowledge and imagination.</p>
                    <p class="text-blue-300">&copy; 2025 RNSIT Library. All rights reserved.</p>
                </div>
                <div>
                    <h4 class="text-lg font-bold mb-4">Follow Us</h4>
                    <div class="flex space-x-4">
                        <a href="https://www.instagram.com/saucyy8008/" target="_blank" class="bg-white text-blue-800 hover:bg-blue-100 rounded-full p-2 transition duration-300">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12 2C6.477 2 2 6.477 2 12c0 5.523 4.477 10 10 10s10-4.477 10-10c0-5.523-4.477-10-10-10zm4.957 7.571h-1.65c-.195 0-.413.257-.413.601v1.186h2.063l-.312 2.091h-1.75v6.142h-2.53v-6.142H10.39v-2.091h1.975v-1.012c0-1.736.984-2.685 2.852-2.685h1.74v1.91z"/>
                            </svg>
                        </a>
                        <a href="mailto:suhasmadhu23is@rnsit.ac.in" class="bg-white text-blue-800 hover:bg-blue-100 rounded-full p-2 transition duration-300">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Mobile menu toggle
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            const mobileMenu = document.getElementById('mobile-menu');
            mobileMenu.classList.toggle('hidden');
        });

        // Navigation links
        document.getElementById('home-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('home-section');
        });

        document.getElementById('catalog-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('catalog-section');
        });

        document.getElementById('events-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('events-section');
        });

        document.getElementById('about-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('about-section');
        });

        document.getElementById('contact-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('contact-section');
        });

        // Mobile navigation links
        document.getElementById('mobile-home-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('home-section');
            document.getElementById('mobile-menu').classList.add('hidden');
        });

        document.getElementById('mobile-catalog-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('catalog-section');
            document.getElementById('mobile-menu').classList.add('hidden');
        });

        document.getElementById('mobile-events-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('events-section');
            document.getElementById('mobile-menu').classList.add('hidden');
        });

        document.getElementById('mobile-about-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('about-section');
            document.getElementById('mobile-menu').classList.add('hidden');
        });

        document.getElementById('mobile-contact-link').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('contact-section');
            document.getElementById('mobile-menu').classList.add('hidden');
        });

        // Browse books button
        document.getElementById('browse-books-btn').addEventListener('click', function(e) {
            e.preventDefault();
            showSection('catalog-section');
        });

        // Library card button
        document.getElementById('library-card-btn').addEventListener('click', function(e) {
            e.preventDefault();
            alert('To get a library card, please visit our library with a valid ID and proof of address.');
        });

        // Search functionality
        document.getElementById('search-button').addEventListener('click', function() {
            const searchTerm = document.getElementById('search-input').value;
            const category = document.getElementById('category-select').value;

            if (searchTerm.trim() === '') {
                alert('Please enter a search term');
                return;
            }

            window.location.href = '/search?query=' + encodeURIComponent(searchTerm) + '&category=' + encodeURIComponent(category);
        });

        // Contact form submission
        document.getElementById('send-message').addEventListener('click', function() {
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const subject = document.getElementById('subject').value;
            const message = document.getElementById('message').value;

            if (name.trim() === '' || email.trim() === '' || subject.trim() === '' || message.trim() === '') {
                alert('Please fill in all fields');
                return;
            }

            alert('Thank you for your message! We will get back to you soon.');

            // Clear form
            document.getElementById('name').value = '';
            document.getElementById('email').value = '';
            document.getElementById('subject').value = '';
            document.getElementById('message').value = '';
        });

        // Helper function to show sections
        function showSection(sectionId) {
            // Scroll to the section
            document.getElementById(sectionId).scrollIntoView({ behavior: 'smooth' });
        }
    </script>
</body>
</html>