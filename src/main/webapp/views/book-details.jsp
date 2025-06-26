<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.title} - RNSIT Library</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-blue-900 text-white shadow-lg">
        <div class="container mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <a href="/" class="text-2xl font-bold">RNSIT LIBRARY</a>
                <div class="space-x-4">
                    <a href="/books" class="hover:text-blue-200 transition duration-300">All Books</a>
                    <a href="/" class="hover:text-blue-200 transition duration-300">Home</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <div class="md:flex">
                <!-- Book Cover Section -->
                <div class="md:w-1/3 bg-blue-100 p-8 flex items-center justify-center">
                    <c:choose>
                        <c:when test="${not empty book.imageUrl}">
                            <img src="${book.imageUrl}" alt="${book.title}" class="h-full max-h-80 w-auto object-contain" />
                        </c:when>
                        <c:otherwise>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-48 w-48 text-blue-800" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                            </svg>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Book Details Section -->
                <div class="md:w-2/3 p-8">
                    <div class="mb-6">
                        <span class="text-sm text-blue-600 font-semibold">${book.category}</span>
                        <h1 class="text-3xl font-bold text-gray-800 mt-2 mb-4">${book.title}</h1>
                        <p class="text-xl text-gray-600 mb-4">by ${book.author}</p>
                        
                        <div class="flex items-center mb-6">
                            <div class="flex text-yellow-400">
                                <c:forEach begin="1" end="5" var="i">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 ${i <= book.rating ? '' : 'text-gray-300'}" viewBox="0 0 20 20" fill="currentColor">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                    </svg>
                                </c:forEach>
                            </div>
                            <span class="text-gray-500 ml-2">(${book.reviewCount} reviews)</span>
                        </div>

                        <div class="mb-6">
                            <span class="inline-block px-4 py-2 rounded-full text-sm font-semibold
                                ${book.status == 'AVAILABLE' ? 'bg-green-100 text-green-800' : 
                                  book.status == 'ON_HOLD' ? 'bg-yellow-100 text-yellow-800' : 
                                  'bg-red-100 text-red-800'}">
                                ${book.status}
                            </span>
                        </div>

                        <div class="prose max-w-none">
                            <h2 class="text-xl font-semibold text-gray-800 mb-2">Description</h2>
                            <p class="text-gray-600">${book.description}</p>
                        </div>
                    </div>

                    <div class="flex space-x-4">
                        <c:choose>
                            <c:when test="${book.status == 'AVAILABLE'}">
                                <button class="bg-blue-800 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-medium transition duration-300">
                                    Borrow Book
                                </button>
                            </c:when>
                            <c:when test="${book.status == 'ON_HOLD'}">
                                <button class="bg-yellow-600 hover:bg-yellow-500 text-white px-6 py-3 rounded-lg font-medium transition duration-300">
                                    Join Waitlist
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="bg-gray-600 text-white px-6 py-3 rounded-lg font-medium cursor-not-allowed" disabled>
                                    Currently Unavailable
                                </button>
                            </c:otherwise>
                        </c:choose>
                        <button class="border border-blue-800 text-blue-800 hover:bg-blue-50 px-6 py-3 rounded-lg font-medium transition duration-300">
                            Add to Wishlist
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 