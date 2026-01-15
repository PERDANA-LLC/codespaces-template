# Developer Guide - Acme SaaS Platform

**Version:** 1.0.0
**Last Updated:** January 2026

## 1. Architecture Overview

### Tech Stack
This project utilizes a modern, robust stack designed for performance, scalability, and developer experience.

- **Framework**: [Next.js 14](https://nextjs.org/) (App Router)
    - Leveraging Server Components for improved initial load times and SEO.
    - `src/app` directory structure.
- **Language**: [TypeScript](https://www.typescriptlang.org/)
    - Strict type safety enabled.
- **Styling**: [Tailwind CSS v3](https://tailwindcss.com/)
    - Utility-first CSS framework.
    - Configured with a "macOS-like" Dark Blue Gradient theme.
- **UI Architecture**:
    - **Shadcn UI**: Headless, accessible components built on Radix UI.
    - **Framer Motion**: For complex animations and layout transitions.
    - **Recharts**: For data visualization.
- **Backend / Services** (Planned):
    - **Supabase**: PostgreSQL database, Authentication, and Realtime subscriptions.
    - **Stripe**: Payment processing and subscription management.

### Project Structure
```
/
├── .devcontainer/      # GitHub Codespaces configuration
├── public/             # Static assets (images, icons)
├── src/
│   ├── app/            # Next.js App Router pages
│   │   ├── globals.css # Global styles & theme variables
│   │   ├── layout.tsx  # Root layout
│   │   └── page.tsx    # Landing page
│   ├── components/     # React Components
│   │   ├── ui/         # Shadcn UI primitives (Button, Card, etc.)
│   │   ├── Hero.tsx    # Hero section component
│   │   └── Navbar.tsx  # Navigation component
│   └── lib/            # Utility functions (cn, etc.)
├── package.json        # Dependencies and scripts
└── tailwind.config.ts  # Tailwind configuration
```

## 2. Setup & Installation

### Prerequisites
- Node.js 18+
- npm

### Installation
1.  **Clone the repository**:
    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2.  **Install Dependencies**:
    ```bash
    npm install
    ```
    *Note: This installs core deps like `next`, `react`, `framer-motion`, `@supabase/supabase-js`, `stripe`, etc.*

3.  **Environment Variables**:
    Create a `.env.local` file in the root directory:
    ```bash
    NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
    NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_key
    STRIPE_SECRET_KEY=your_stripe_key
    ```

4.  **Run Development Server**:
    ```bash
    npm run dev
    ```
    Open `http://localhost:3000` to view the app.

## 3. Design System & Styling

### Theme Configuration
The application uses a custom "Dark Blue Gradient" theme inspired by modern macOS interfaces. Major variables are defined in `src/app/globals.css`.

**Key CSS Variables:**
```css
:root {
  --background: 222 47% 11%;
  --foreground: 210 40% 98%;
  --primary: 217 91% 60%;
  /* ...others */
}
```

### Glassmorphism
We utilize custom utility classes for glass-like effects:
- `.glass`: Heavy blur, light border. Used for the Navbar.
- `.glass-card`: Darker, suitable for dashboard panels.

### Animation
Animations are handled principally by **Framer Motion**.
Example usage (fade-in):
```tsx
<motion.div
  initial={{ opacity: 0, y: 20 }}
  animate={{ opacity: 1, y: 0 }}
>
  Content
</motion.div>
```

## 4. Component Guidelines

### Creating New Components
1.  **Primitives**: If you need a basic UI element (e.g., Dropdown, Dialog), verify if Shadcn UI supports it first.
    ```bash
    npx shadcn@latest add <component-name>
    ```
2.  **Feature Components**: Place feature-specific logic in `src/components`. Keep them client-side (`'use client'`) only if they use hooks or event listeners.

### Navbar
The `Navbar` component is fixed and floating. It uses a high z-index (`z-50`) to ensure visibility over scrolling content.

## 5. Deployment

### Vercel (Recommended)
This template is optimized for Vercel.
1.  Push code to GitHub.
2.  Import project into Vercel.
3.  Add Environment Variables in the Vercel Dashboard.
4.  Deploy.

## 6. Troubleshooting

### Tailwind vs Shadcn
We explicitly use **Tailwind v3** because Shadcn UI relies on it (and its plugin ecosystem). Do not upgrade to Tailwind v4 alpha unless you are prepared to manually migrate all Shadcn primitives.

### Hydration Errors
If incorporating random data or date-dependent rendering, rely on `useEffect` to set state on the client, or move that logic to Server Components where appropriate, to avoid hydration mismatches.
