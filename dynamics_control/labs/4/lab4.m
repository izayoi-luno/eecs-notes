OLTF = tf([1 3 2],[1 17 82 120 0 0])
CLTF = feedback(OLTF,1)

OLTF2 = tf([300],[1 95 -500 0])

OLTF3 = tf([10],[1 2 0])

OLTF4 = tf([1 20],[1 202 400 0])
