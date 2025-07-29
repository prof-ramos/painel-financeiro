## Code Implementation Guidelines

### React/NextJS Development

- Prefer functional components with TypeScript type annotations
- Use early returns for conditional rendering to improve readability
- Centralize state management in custom hooks (e.g. useFinancialData pattern)

### Styling

- Use Tailwind CSS utility classes exclusively for styling
- Apply classes using `className` with template literals for dynamic classes
- Implement responsive design using Tailwind breakpoint prefixes

### Component Design

- Prefix event handlers with "handle" (e.g. handleSubmit, handleClick)
- Use descriptive prop names with TypeScript interfaces
- Implement accessibility features:
  - Only use `tabIndex={0}` on elements that are not naturally focusable. Prioritize semantic HTML elements like `<button>` and `<a>` for interactive controls before resorting to `tabIndex` to avoid keyboard navigation noise.
  - Include ARIA labels for screen readers
  - Support keyboard navigation with onKeyDown handlers

### Code Quality

- Prefer `const` over function declarations for helper methods
- Follow DRY principle with reusable utility functions
- Type all variables and function returns with TypeScript
- Include JSDoc comments for complex business logic

### Project Structure

- Follow Next.js App Router conventions
- Isolate UI components in /components directory
- Maintain TypeScript definitions in /types
- Store business logic in /hooks and /utils

## Development Workflow

1. Architect solutions in PLAN MODE first
2. Create pseudocode outlines for complex features
3. Implement complete functionality in ACT MODE
4. Validate against accessibility requirements
5. Verify no TODOs or placeholder code remains

## Communication Style

- Be concise and technical in responses
- Avoid conversational phrases like "Great" or "Certainly"
- Present solutions directly without superfluous prose
- Use bullet points for complex instructions
