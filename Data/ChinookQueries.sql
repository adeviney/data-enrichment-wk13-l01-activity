USE chinook;

# 1. What is the most a customer has spent on a single purchase and what is their customerId?
SELECT CustomerId, Total
FROM invoice
ORDER BY Total DESC
LIMIT 1;

#2. What country is the customer with the largest total bill from (from question 2)?
SELECT i.CustomerId, i.Total, c.Country
FROM invoice i JOIN customer c ON i.CustomerId = c.CustomerId
ORDER BY Total DESC
LIMIT 1;

# 3. Which customerID made the fewest purchases (invoices)?
SELECT i.CustomerId, COUNT(*) as num_purchases
FROM invoice i
GROUP BY CustomerId
ORDER BY num_purchases 
LIMIT 1;

#  4. Retrieve the id, name, and # of playlists for  tracks that appear on playlists more than 4 times?
SELECT t.TrackId, t.Name, COUNT(*) as num_playlists_per_track
FROM track t JOIN playlisttrack pt ON pt.TrackId = t.TrackId
JOIN playlist p ON p.PlaylistId = pt.PlaylistId 
GROUP BY pt.TrackId
HAVING num_playlists_per_track > 4
ORDER BY num_playlists_per_track DESC