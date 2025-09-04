SELECT u.id, u.name,
       JSON_ARRAYAGG(JSON_OBJECT(
           'shift_name', s.shift_name,
           'hours', (
               SELECT JSON_ARRAYAGG(JSON_OBJECT(
                   'start_time', h.start_time,
                   'end_time', h.end_time
               ))
               FROM shift_hours h
               WHERE h.shift_id = s.id
           )
       )) AS shifts
FROM users u
LEFT JOIN user_shifts s ON u.id = s.user_id
WHERE u.status = 'active'
GROUP BY u.id
LIMIT 100 OFFSET 0;