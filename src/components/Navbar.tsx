'use client';

import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { motion } from 'framer-motion';

export function Navbar() {
    return (
        <motion.nav
            initial={{ y: -100, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            className="fixed top-4 left-1/2 -translate-x-1/2 w-[90%] max-w-5xl glass rounded-full px-6 py-3 flex items-center justify-between z-50"
        >
            <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-primary rounded-lg shadow-lg shadow-primary/20" />
                <span className="font-bold text-lg tracking-tight">Acme SaaS</span>
            </div>

            <div className="hidden md:flex items-center gap-6 text-sm font-medium text-slate-300">
                <Link href="#features" className="hover:text-white transition-colors">Features</Link>
                <Link href="#pricing" className="hover:text-white transition-colors">Pricing</Link>
                <Link href="#about" className="hover:text-white transition-colors">About</Link>
            </div>

            <div className="flex items-center gap-4">
                <Button variant="ghost" className="text-slate-300 hover:text-white hover:bg-white/10">Sign In</Button>
                <Button className="bg-primary hover:bg-primary/90 text-primary-foreground shadow-lg shadow-primary/20">Get Started</Button>
            </div>
        </motion.nav>
    );
}
