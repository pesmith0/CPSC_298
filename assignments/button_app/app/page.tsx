'use client'

import { useState } from 'react'
import { Button } from "@/components/ui/button"

export default function ButtonPressCounter() {
  const [count, setCount] = useState(0)

  const incrementCount = () => {
    setCount(prevCount => prevCount + 1)
  }

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-background">
      <h1 className="text-4xl font-bold mb-8 text-primary">Button Press Counter</h1>
      <div className="text-6xl font-bold mb-8 text-primary">{count}</div>
      <Button 
        onClick={incrementCount}
        className="px-6 py-3 text-lg"
      >
        Increment
      </Button>
    </div>
  )
}