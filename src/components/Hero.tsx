'use client';

import { Button } from '@/components/ui/button';
import { motion } from 'framer-motion';

export function Hero() {
    return (
        <section className="min-h-screen flex flex-col items-center justify-center pt-20 px-4 text-center relative overflow-hidden">
            {/* Background Glows */}
            <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-primary/20 rounded-full blur-[100px] -z-10 animate-pulse" />
            <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-purple-500/20 rounded-full blur-[100px] -z-10 animate-pulse delay-1000" />

            <motion.h1
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 }}
                className="text-5xl md:text-7xl font-bold tracking-tighter mb-6 bg-clip-text text-transparent bg-gradient-to-b from-white to-white/60"
            >
                Build Faster with <br />
                <span className="text-primary">Next Gen SaaS</span>
            </motion.h1>

            <motion.p
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.4 }}
                className="text-lg md:text-xl text-slate-400 max-w-2xl mb-8 leading-relaxed"
            >
                Experience the future of web development. A premium, high-performance template designed for serious SaaS founders.
            </motion.p>

            <motion.div
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: 0.6 }}
                className="flex items-center gap-4"
            >
                <Button size="lg" className="h-12 px-8 text-base bg-white text-black hover:bg-white/90 shadow-xl shadow-white/10">
                    Start for Free
                </Button>
                <Button size="lg" variant="outline" className="h-12 px-8 text-base glass border-white/10 hover:bg-white/10">
                    View Demo
                </Button>
            </motion.div>

            {/* Mock UI Interface */}
            <motion.div
                initial={{ opacity: 0, y: 40 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.8, duration: 0.8 }}
                className="mt-20 w-full max-w-5xl glass-card rounded-xl border border-white/10 shadow-2xl overflow-hidden"
            >
                <div className="h-12 border-b border-white/10 flex items-center px-4 gap-2">
                    <div className="flex gap-2">
                        <div className="w-3 h-3 rounded-full bg-red-500/50" />
                        <div className="w-3 h-3 rounded-full bg-yellow-500/50" />
                        <div className="w-3 h-3 rounded-full bg-green-500/50" />
                    </div>
                    <div className="w-full text-center text-xs text-slate-500 font-mono">dashboard.saas.com</div>
                </div>
                <div className="p-8 h-[400px] bg-black/40 flex items-center justify-center text-slate-600">
                    {/* Placeholder for Dashboard Content/Charts */}
                    [Dashboard Interface Placeholder]
                </div>
            </motion.div>
        </section>
    );
}
