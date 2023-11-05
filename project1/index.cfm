<!DOCTYPE html>
<html>
<head>
    <title>Ana Sayfa - Haberler</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .nav {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .nav li {
            margin: 0 10px;
        }

        .nav a {
            text-decoration: none;
            color: #333;
        }

        .news-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .news-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }

        .news-card:hover {
            transform: translateY(-5px);
        }

        .news-image {
            height: 200px;
            overflow: hidden;
        }

        .news-image img {
            width: 100%;
            object-fit: cover;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        .news-details {
            padding: 20px;
        }

        .news-title {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .news-body {
            color: #555;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .news-tags {
            color: #888;
        }

        .news-tags strong {
            color: #333;
        }
    </style>
</head>
<body>
    <h1>Son Haberler</h1>

    <!-- Sekmelerin bulunduğu menü -->
    <ul class="nav">
        <li><a href="index.cfm">Ana Sayfa</a></li>
        <li><a href="views/newsList.cfm">Haberler</a></li>
        <li><a href="views/newsDetail.cfm">Haber Detayları</a></li>
        <li><a href="views/newsUpdate.cfm">Haber Güncelleme</a></li>
    </ul>

    <div class="news-container" id="newsContainer">
        <!-- Card'lar buraya eklenecek -->
    </div>

    <script>
        fetch('https://dummyjson.com/posts')
            .then(response => response.json())
            .then(data => {
                const newsList = data.posts;
                const newsContainer = document.getElementById('newsContainer');

                newsList.forEach(news => {
                    const card = document.createElement('div');
                    card.classList.add('news-card');

                    const imageDiv = document.createElement('div');
                    imageDiv.classList.add('news-image');
                    const image = document.createElement('img');
                    image.src = `https://via.placeholder.com/400x200?text=${encodeURI(news.title)}`;
                    imageDiv.appendChild(image);
                    card.appendChild(imageDiv);

                    const details = document.createElement('div');
                    details.classList.add('news-details');

                    const title = document.createElement('div');
                    title.classList.add('news-title');
                    title.textContent = news.title;

                    const body = document.createElement('div');
                    body.classList.add('news-body');
                    body.textContent = news.body;

                    const tags = document.createElement('div');
                    tags.classList.add('news-tags');
                    tags.innerHTML = '<strong>Etiketler:</strong> ' + news.tags.join(', ');

                    details.appendChild(title);
                    details.appendChild(body);
                    details.appendChild(tags);
                    card.appendChild(details);

                    newsContainer.appendChild(card);
                });
            })
            .catch(error => console.error('Hata:', error));
    </script>
</body>
</html>
