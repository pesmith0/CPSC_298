import pygame
import random

# Initialize Pygame
pygame.init()

# Set up some constants
WIDTH, HEIGHT = 800, 600
SPEED = 10

# Set up the display
screen = pygame.display.set_mode((WIDTH, HEIGHT))

# Set up the snake and food
snake = [(200, 200), (220, 200), (240, 200)]
food = (400, 300)
direction = (1, 0)

# Game loop
while True:
    # Handle events
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            quit()
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP and direction != (0, 1):
                direction = (0, -1)
            elif event.key == pygame.K_DOWN and direction != (0, -1):
                direction = (0, 1)
            elif event.key == pygame.K_LEFT and direction != (1, 0):
                direction = (-1, 0)
            elif event.key == pygame.K_RIGHT and direction != (-1, 0):
                direction = (1, 0)

    # Move the snake
    head = snake[0]
    new_head = (head[0] + direction[0] * SPEED, head[1] + direction[1] * SPEED)
    snake.insert(0, new_head)

    # Check for collision with food
    if snake[0] == food:
        food = (random.randint(0, WIDTH - 10), random.randint(0, HEIGHT - 10))
    else:
        snake.pop()

    # Draw everything
    screen.fill((0, 0, 0))
    for pos in snake:
        pygame.draw.rect(screen, (0, 255, 0), pygame.Rect(pos[0], pos[1], 20, 20))
    pygame.draw.rect(screen, (255, 0, 0), pygame.Rect(food[0], food[1], 10, 10))
    pygame.display.flip()

    # Cap the frame rate
    pygame.time.delay(100)
