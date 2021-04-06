! function(e) {
  "use strict"
    var t = {};

    function n(a) {
        if (t[a]) return t[a].exports;
        var r = t[a] = {
            i: a,
            l: !1,
            exports: {}
        };
        return e[a].call(r.exports, r, r.exports, n), r.l = !0, r.exports
    }
    n.m = e, n.c = t, n.d = function(e, t, a) {
        n.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: a
        })
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.t = function(e, t) {
        if (1 & t && (e = n(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var a = Object.create(null);
        if (n.r(a), Object.defineProperty(a, "default", {
                enumerable: !0,
                value: e
            }), 2 & t && "string" != typeof e)
            for (var r in e) n.d(a, r, function(t) {
                return e[t]
            }.bind(null, r));
        return a
    }, n.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return n.d(t, "a", t), t
    }, n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.p = "/", n(n.s = 0)
}({
    0: function(e, t, n) {
        n(1), n(6), e.exports = n(27)
    },
    1: function(e, t, n) {
        n(2)
    },
    2: function(e, t, n) {
        (function(t) {
            var n = function(e) {
                var t = /\blang(?:uage)?-([\w-]+)\b/i,
                    n = 0,
                    a = {
                        manual: e.Prism && e.Prism.manual,
                        disableWorkerMessageHandler: e.Prism && e.Prism.disableWorkerMessageHandler,
                        util: {
                            encode: function(e) {
                                return e instanceof r ? new r(e.type, a.util.encode(e.content), e.alias) : Array.isArray(e) ? e.map(a.util.encode) : e.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/\u00a0/g, " ")
                            },
                            type: function(e) {
                                return Object.prototype.toString.call(e).slice(8, -1)
                            },
                            objId: function(e) {
                                return e.__id || Object.defineProperty(e, "__id", {
                                    value: ++n
                                }), e.__id
                            },
                            clone: function e(t, n) {
                                var r, i, s = a.util.type(t);
                                switch (n = n || {}, s) {
                                    case "Object":
                                        if (i = a.util.objId(t), n[i]) return n[i];
                                        for (var o in r = {}, n[i] = r, t) t.hasOwnProperty(o) && (r[o] = e(t[o], n));
                                        return r;
                                    case "Array":
                                        return i = a.util.objId(t), n[i] ? n[i] : (r = [], n[i] = r, t.forEach((function(t, a) {
                                            r[a] = e(t, n)
                                        })), r);
                                    default:
                                        return t
                                }
                            },
                            currentScript: function() {
                                if ("undefined" == typeof document) return null;
                                if ("currentScript" in document) return document.currentScript;
                                try {
                                    throw new Error
                                } catch (a) {
                                    var e = (/at [^(\r\n]*\((.*):.+:.+\)$/i.exec(a.stack) || [])[1];
                                    if (e) {
                                        var t = document.getElementsByTagName("script");
                                        for (var n in t)
                                            if (t[n].src == e) return t[n]
                                    }
                                    return null
                                }
                            }
                        },
                        languages: {
                            extend: function(e, t) {
                                var n = a.util.clone(a.languages[e]);
                                for (var r in t) n[r] = t[r];
                                return n
                            },
                            insertBefore: function(e, t, n, r) {
                                var i = (r = r || a.languages)[e],
                                    s = {};
                                for (var o in i)
                                    if (i.hasOwnProperty(o)) {
                                        if (o == t)
                                            for (var l in n) n.hasOwnProperty(l) && (s[l] = n[l]);
                                        n.hasOwnProperty(o) || (s[o] = i[o])
                                    } var c = r[e];
                                return r[e] = s, a.languages.DFS(a.languages, (function(t, n) {
                                    n === c && t != e && (this[t] = s)
                                })), s
                            },
                            DFS: function e(t, n, r, i) {
                                i = i || {};
                                var s = a.util.objId;
                                for (var o in t)
                                    if (t.hasOwnProperty(o)) {
                                        n.call(t, o, t[o], r || o);
                                        var l = t[o],
                                            c = a.util.type(l);
                                        "Object" !== c || i[s(l)] ? "Array" !== c || i[s(l)] || (i[s(l)] = !0, e(l, n, o, i)) : (i[s(l)] = !0, e(l, n, null, i))
                                    }
                            }
                        },
                        plugins: {},
                        highlightAll: function(e, t) {
                            a.highlightAllUnder(document, e, t)
                        },
                        highlightAllUnder: function(e, t, n) {
                            var r = {
                                callback: n,
                                selector: 'code[class*="language-"], [class*="language-"] code, code[class*="lang-"], [class*="lang-"] code'
                            };
                            a.hooks.run("before-highlightall", r);
                            for (var i, s = e.querySelectorAll(r.selector), o = 0; i = s[o++];) a.highlightElement(i, !0 === t, r.callback)
                        },
                        highlightElement: function(n, r, i) {
                            var s = function(e) {
                                    for (; e && !t.test(e.className);) e = e.parentNode;
                                    return e ? (e.className.match(t) || [, "none"])[1].toLowerCase() : "none"
                                }(n),
                                o = a.languages[s];
                            n.className = n.className.replace(t, "").replace(/\s+/g, " ") + " language-" + s;
                            var l = n.parentNode;
                            l && "pre" === l.nodeName.toLowerCase() && (l.className = l.className.replace(t, "").replace(/\s+/g, " ") + " language-" + s);
                            var c = {
                                element: n,
                                language: s,
                                grammar: o,
                                code: n.textContent
                            };

                            function u(e) {
                                c.highlightedCode = e, a.hooks.run("before-insert", c), c.element.innerHTML = c.highlightedCode, a.hooks.run("after-highlight", c), a.hooks.run("complete", c), i && i.call(c.element)
                            }
                            if (a.hooks.run("before-sanity-check", c), !c.code) return a.hooks.run("complete", c), void(i && i.call(c.element));
                            if (a.hooks.run("before-highlight", c), c.grammar)
                                if (r && e.Worker) {
                                    var d = new Worker(a.filename);
                                    d.onmessage = function(e) {
                                        u(e.data)
                                    }, d.postMessage(JSON.stringify({
                                        language: c.language,
                                        code: c.code,
                                        immediateClose: !0
                                    }))
                                } else u(a.highlight(c.code, c.grammar, c.language));
                            else u(a.util.encode(c.code))
                        },
                        highlight: function(e, t, n) {
                            var i = {
                                code: e,
                                grammar: t,
                                language: n
                            };
                            return a.hooks.run("before-tokenize", i), i.tokens = a.tokenize(i.code, i.grammar), a.hooks.run("after-tokenize", i), r.stringify(a.util.encode(i.tokens), i.language)
                        },
                        matchGrammar: function(e, t, n, i, s, o, l) {
                            for (var c in n)
                                if (n.hasOwnProperty(c) && n[c]) {
                                    var u = n[c];
                                    u = Array.isArray(u) ? u : [u];
                                    for (var d = 0; d < u.length; ++d) {
                                        if (l && l == c + "," + d) return;
                                        var p = u[d],
                                            f = p.inside,
                                            g = !!p.lookbehind,
                                            m = !!p.greedy,
                                            h = 0,
                                            v = p.alias;
                                        if (m && !p.pattern.global) {
                                            var b = p.pattern.toString().match(/[imsuy]*$/)[0];
                                            p.pattern = RegExp(p.pattern.source, b + "g")
                                        }
                                        p = p.pattern || p;
                                        for (var k = i, y = s; k < t.length; y += t[k].length, ++k) {
                                            var S = t[k];
                                            if (t.length > e.length) return;
                                            if (!(S instanceof r)) {
                                                if (m && k != t.length - 1) {
                                                    if (p.lastIndex = y, !(N = p.exec(e))) break;
                                                    for (var w = N.index + (g && N[1] ? N[1].length : 0), x = N.index + N[0].length, A = k, j = y, L = t.length; A < L && (j < x || !t[A].type && !t[A - 1].greedy); ++A)(j += t[A].length) <= w && (++k, y = j);
                                                    if (t[k] instanceof r) continue;
                                                    P = A - k, S = e.slice(y, j), N.index -= y
                                                } else {
                                                    p.lastIndex = 0;
                                                    var N = p.exec(S),
                                                        P = 1
                                                }
                                                if (N) {
                                                    g && (h = N[1] ? N[1].length : 0), x = (w = N.index + h) + (N = N[0].slice(h)).length;
                                                    var C = S.slice(0, w),
                                                        E = S.slice(x),
                                                        T = [k, P];
                                                    C && (++k, y += C.length, T.push(C));
                                                    var O = new r(c, f ? a.tokenize(N, f) : N, v, N, m);
                                                    if (T.push(O), E && T.push(E), Array.prototype.splice.apply(t, T), 1 != P && a.matchGrammar(e, t, n, k, y, !0, c + "," + d), o) break
                                                } else if (o) break
                                            }
                                        }
                                    }
                                }
                        },
                        tokenize: function(e, t) {
                            var n = [e],
                                r = t.rest;
                            if (r) {
                                for (var i in r) t[i] = r[i];
                                delete t.rest
                            }
                            return a.matchGrammar(e, n, t, 0, 0, !1), n
                        },
                        hooks: {
                            all: {},
                            add: function(e, t) {
                                var n = a.hooks.all;
                                n[e] = n[e] || [], n[e].push(t)
                            },
                            run: function(e, t) {
                                var n = a.hooks.all[e];
                                if (n && n.length)
                                    for (var r, i = 0; r = n[i++];) r(t)
                            }
                        },
                        Token: r
                    };

                function r(e, t, n, a, r) {
                    this.type = e, this.content = t, this.alias = n, this.length = 0 | (a || "").length, this.greedy = !!r
                }
                if (e.Prism = a, r.stringify = function(e, t) {
                        if ("string" == typeof e) return e;
                        if (Array.isArray(e)) return e.map((function(e) {
                            return r.stringify(e, t)
                        })).join("");
                        var n = {
                            type: e.type,
                            content: r.stringify(e.content, t),
                            tag: "span",
                            classes: ["token", e.type],
                            attributes: {},
                            language: t
                        };
                        if (e.alias) {
                            var i = Array.isArray(e.alias) ? e.alias : [e.alias];
                            Array.prototype.push.apply(n.classes, i)
                        }
                        a.hooks.run("wrap", n);
                        var s = Object.keys(n.attributes).map((function(e) {
                            return e + '="' + (n.attributes[e] || "").replace(/"/g, "&quot;") + '"'
                        })).join(" ");
                        return "<" + n.tag + ' class="' + n.classes.join(" ") + '"' + (s ? " " + s : "") + ">" + n.content + "</" + n.tag + ">"
                    }, !e.document) return e.addEventListener && (a.disableWorkerMessageHandler || e.addEventListener("message", (function(t) {
                    var n = JSON.parse(t.data),
                        r = n.language,
                        i = n.code,
                        s = n.immediateClose;
                    e.postMessage(a.highlight(i, a.languages[r], r)), s && e.close()
                }), !1)), a;
                var i = a.util.currentScript();
                if (i && (a.filename = i.src, i.hasAttribute("data-manual") && (a.manual = !0)), !a.manual) {
                    var s = function() {
                            a.manual || a.highlightAll()
                        },
                        o = document.readyState;
                    "loading" === o || "interactive" === o && i.defer ? document.addEventListener("DOMContentLoaded", s) : window.requestAnimationFrame ? window.requestAnimationFrame(s) : window.setTimeout(s, 16)
                }
                return a
            }("undefined" != typeof window ? window : "undefined" != typeof WorkerGlobalScope && self instanceof WorkerGlobalScope ? self : {});
            e.exports && (e.exports = n), void 0 !== t && (t.Prism = n), n.languages.markup = {
                    comment: /<!--[\s\S]*?-->/,
                    prolog: /<\?[\s\S]+?\?>/,
                    doctype: {
                        pattern: /<!DOCTYPE(?:[^>"'[\]]|"[^"]*"|'[^']*')+(?:\[(?:(?!<!--)[^"'\]]|"[^"]*"|'[^']*'|<!--[\s\S]*?-->)*\]\s*)?>/i,
                        greedy: !0
                    },
                    cdata: /<!\[CDATA\[[\s\S]*?]]>/i,
                    tag: {
                        pattern: /<\/?(?!\d)[^\s>\/=$<%]+(?:\s(?:\s*[^\s>\/=]+(?:\s*=\s*(?:"[^"]*"|'[^']*'|[^\s'">=]+(?=[\s>]))|(?=[\s/>])))+)?\s*\/?>/i,
                        greedy: !0,
                        inside: {
                            tag: {
                                pattern: /^<\/?[^\s>\/]+/i,
                                inside: {
                                    punctuation: /^<\/?/,
                                    namespace: /^[^\s>\/:]+:/
                                }
                            },
                            "attr-value": {
                                pattern: /=\s*(?:"[^"]*"|'[^']*'|[^\s'">=]+)/i,
                                inside: {
                                    punctuation: [/^=/, {
                                        pattern: /^(\s*)["']|["']$/,
                                        lookbehind: !0
                                    }]
                                }
                            },
                            punctuation: /\/?>/,
                            "attr-name": {
                                pattern: /[^\s>\/]+/,
                                inside: {
                                    namespace: /^[^\s>\/:]+:/
                                }
                            }
                        }
                    },
                    entity: /&#?[\da-z]{1,8};/i
                }, n.languages.markup.tag.inside["attr-value"].inside.entity = n.languages.markup.entity, n.hooks.add("wrap", (function(e) {
                    "entity" === e.type && (e.attributes.title = e.content.replace(/&amp;/, "&"))
                })), Object.defineProperty(n.languages.markup.tag, "addInlined", {
                    value: function(e, t) {
                        var a = {};
                        a["language-" + t] = {
                            pattern: /(^<!\[CDATA\[)[\s\S]+?(?=\]\]>$)/i,
                            lookbehind: !0,
                            inside: n.languages[t]
                        }, a.cdata = /^<!\[CDATA\[|\]\]>$/i;
                        var r = {
                            "included-cdata": {
                                pattern: /<!\[CDATA\[[\s\S]*?\]\]>/i,
                                inside: a
                            }
                        };
                        r["language-" + t] = {
                            pattern: /[\s\S]+/,
                            inside: n.languages[t]
                        };
                        var i = {};
                        i[e] = {
                            pattern: RegExp("(<__[\\s\\S]*?>)(?:<!\\[CDATA\\[[\\s\\S]*?\\]\\]>\\s*|[\\s\\S])*?(?=<\\/__>)".replace(/__/g, e), "i"),
                            lookbehind: !0,
                            greedy: !0,
                            inside: r
                        }, n.languages.insertBefore("markup", "cdata", i)
                    }
                }), n.languages.xml = n.languages.extend("markup", {}), n.languages.html = n.languages.markup, n.languages.mathml = n.languages.markup, n.languages.svg = n.languages.markup,
                function(e) {
                    var t = /("|')(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/;
                    e.languages.css = {
                        comment: /\/\*[\s\S]*?\*\//,
                        atrule: {
                            pattern: /@[\w-]+[\s\S]*?(?:;|(?=\s*\{))/,
                            inside: {
                                rule: /@[\w-]+/
                            }
                        },
                        url: {
                            pattern: RegExp("url\\((?:" + t.source + "|[^\n\r()]*)\\)", "i"),
                            inside: {
                                function: /^url/i,
                                punctuation: /^\(|\)$/
                            }
                        },
                        selector: RegExp("[^{}\\s](?:[^{};\"']|" + t.source + ")*?(?=\\s*\\{)"),
                        string: {
                            pattern: t,
                            greedy: !0
                        },
                        property: /[-_a-z\xA0-\uFFFF][-\w\xA0-\uFFFF]*(?=\s*:)/i,
                        important: /!important\b/i,
                        function: /[-a-z0-9]+(?=\()/i,
                        punctuation: /[(){};:,]/
                    }, e.languages.css.atrule.inside.rest = e.languages.css;
                    var n = e.languages.markup;
                    n && (n.tag.addInlined("style", "css"), e.languages.insertBefore("inside", "attr-value", {
                        "style-attr": {
                            pattern: /\s*style=("|')(?:\\[\s\S]|(?!\1)[^\\])*\1/i,
                            inside: {
                                "attr-name": {
                                    pattern: /^\s*style/i,
                                    inside: n.tag.inside
                                },
                                punctuation: /^\s*=\s*['"]|['"]\s*$/,
                                "attr-value": {
                                    pattern: /.+/i,
                                    inside: e.languages.css
                                }
                            },
                            alias: "language-css"
                        }
                    }, n.tag))
                }(n), n.languages.clike = {
                    comment: [{
                        pattern: /(^|[^\\])\/\*[\s\S]*?(?:\*\/|$)/,
                        lookbehind: !0
                    }, {
                        pattern: /(^|[^\\:])\/\/.*/,
                        lookbehind: !0,
                        greedy: !0
                    }],
                    string: {
                        pattern: /(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
                        greedy: !0
                    },
                    "class-name": {
                        pattern: /(\b(?:class|interface|extends|implements|trait|instanceof|new)\s+|\bcatch\s+\()[\w.\\]+/i,
                        lookbehind: !0,
                        inside: {
                            punctuation: /[.\\]/
                        }
                    },
                    keyword: /\b(?:if|else|while|do|for|return|in|instanceof|function|new|try|throw|catch|finally|null|break|continue)\b/,
                    boolean: /\b(?:true|false)\b/,
                    function: /\w+(?=\()/,
                    number: /\b0x[\da-f]+\b|(?:\b\d+\.?\d*|\B\.\d+)(?:e[+-]?\d+)?/i,
                    operator: /[<>]=?|[!=]=?=?|--?|\+\+?|&&?|\|\|?|[?*/~^%]/,
                    punctuation: /[{}[\];(),.:]/
                },
                function(e) {
                    e.languages.css.selector = {
                        pattern: e.languages.css.selector,
                        inside: {
                            "pseudo-element": /:(?:after|before|first-letter|first-line|selection)|::[-\w]+/,
                            "pseudo-class": /:[-\w]+/,
                            class: /\.[-:.\w]+/,
                            id: /#[-:.\w]+/,
                            attribute: {
                                pattern: /\[(?:[^[\]"']|("|')(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1)*\]/,
                                greedy: !0,
                                inside: {
                                    punctuation: /^\[|\]$/,
                                    "case-sensitivity": {
                                        pattern: /(\s)[si]$/i,
                                        lookbehind: !0,
                                        alias: "keyword"
                                    },
                                    namespace: {
                                        pattern: /^(\s*)[-*\w\xA0-\uFFFF]*\|(?!=)/,
                                        lookbehind: !0,
                                        inside: {
                                            punctuation: /\|$/
                                        }
                                    },
                                    attribute: {
                                        pattern: /^(\s*)[-\w\xA0-\uFFFF]+/,
                                        lookbehind: !0
                                    },
                                    value: [/("|')(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/, {
                                        pattern: /(=\s*)[-\w\xA0-\uFFFF]+(?=\s*$)/,
                                        lookbehind: !0
                                    }],
                                    operator: /[|~*^$]?=/
                                }
                            },
                            "n-th": [{
                                pattern: /(\(\s*)[+-]?\d*[\dn](?:\s*[+-]\s*\d+)?(?=\s*\))/,
                                lookbehind: !0,
                                inside: {
                                    number: /[\dn]+/,
                                    operator: /[+-]/
                                }
                            }, {
                                pattern: /(\(\s*)(?:even|odd)(?=\s*\))/i,
                                lookbehind: !0
                            }],
                            punctuation: /[()]/
                        }
                    }, e.languages.insertBefore("css", "property", {
                        variable: {
                            pattern: /(^|[^-\w\xA0-\uFFFF])--[-_a-z\xA0-\uFFFF][-\w\xA0-\uFFFF]*/i,
                            lookbehind: !0
                        }
                    });
                    var t = {
                            pattern: /(\d)(?:%|[a-z]+)/,
                            lookbehind: !0
                        },
                        n = {
                            pattern: /(^|[^\w.-])-?\d*\.?\d+/,
                            lookbehind: !0
                        };
                    e.languages.insertBefore("css", "function", {
                        operator: {
                            pattern: /(\s)[+\-*\/](?=\s)/,
                            lookbehind: !0
                        },
                        hexcode: {
                            pattern: /\B#(?:[\da-f]{1,2}){3,4}\b/i,
                            alias: "color"
                        },
                        color: [/\b(?:AliceBlue|AntiqueWhite|Aqua|Aquamarine|Azure|Beige|Bisque|Black|BlanchedAlmond|Blue|BlueViolet|Brown|BurlyWood|CadetBlue|Chartreuse|Chocolate|Coral|CornflowerBlue|Cornsilk|Crimson|Cyan|DarkBlue|DarkCyan|DarkGoldenRod|DarkGr[ae]y|DarkGreen|DarkKhaki|DarkMagenta|DarkOliveGreen|DarkOrange|DarkOrchid|DarkRed|DarkSalmon|DarkSeaGreen|DarkSlateBlue|DarkSlateGr[ae]y|DarkTurquoise|DarkViolet|DeepPink|DeepSkyBlue|DimGr[ae]y|DodgerBlue|FireBrick|FloralWhite|ForestGreen|Fuchsia|Gainsboro|GhostWhite|Gold|GoldenRod|Gr[ae]y|Green|GreenYellow|HoneyDew|HotPink|IndianRed|Indigo|Ivory|Khaki|Lavender|LavenderBlush|LawnGreen|LemonChiffon|LightBlue|LightCoral|LightCyan|LightGoldenRodYellow|LightGr[ae]y|LightGreen|LightPink|LightSalmon|LightSeaGreen|LightSkyBlue|LightSlateGr[ae]y|LightSteelBlue|LightYellow|Lime|LimeGreen|Linen|Magenta|Maroon|MediumAquaMarine|MediumBlue|MediumOrchid|MediumPurple|MediumSeaGreen|MediumSlateBlue|MediumSpringGreen|MediumTurquoise|MediumVioletRed|MidnightBlue|MintCream|MistyRose|Moccasin|NavajoWhite|Navy|OldLace|Olive|OliveDrab|Orange|OrangeRed|Orchid|PaleGoldenRod|PaleGreen|PaleTurquoise|PaleVioletRed|PapayaWhip|PeachPuff|Peru|Pink|Plum|PowderBlue|Purple|Red|RosyBrown|RoyalBlue|SaddleBrown|Salmon|SandyBrown|SeaGreen|SeaShell|Sienna|Silver|SkyBlue|SlateBlue|SlateGr[ae]y|Snow|SpringGreen|SteelBlue|Tan|Teal|Thistle|Tomato|Turquoise|Violet|Wheat|White|WhiteSmoke|Yellow|YellowGreen)\b/i, {
                            pattern: /\b(?:rgb|hsl)\(\s*\d{1,3}\s*,\s*\d{1,3}%?\s*,\s*\d{1,3}%?\s*\)\B|\b(?:rgb|hsl)a\(\s*\d{1,3}\s*,\s*\d{1,3}%?\s*,\s*\d{1,3}%?\s*,\s*(?:0|0?\.\d+|1)\s*\)\B/i,
                            inside: {
                                unit: t,
                                number: n,
                                function: /[\w-]+(?=\()/,
                                punctuation: /[(),]/
                            }
                        }],
                        entity: /\\[\da-f]{1,8}/i,
                        unit: t,
                        number: n
                    })
                }(n),
                function(e) {
                    e.languages.diff = {
                        coord: [/^(?:\*{3}|-{3}|\+{3}).*$/m, /^@@.*@@$/m, /^\d+.*$/m]
                    };
                    var t = {
                        "deleted-sign": "-",
                        "deleted-arrow": "<",
                        "inserted-sign": "+",
                        "inserted-arrow": ">",
                        unchanged: " ",
                        diff: "!"
                    };
                    Object.keys(t).forEach((function(n) {
                        var a = t[n],
                            r = [];
                        /^\w+$/.test(n) || r.push(/\w+/.exec(n)[0]), "diff" === n && r.push("bold"), e.languages.diff[n] = {
                            pattern: RegExp("^(?:[" + a + "].*(?:\r\n?|\n|(?![\\s\\S])))+", "m"),
                            alias: r
                        }
                    })), Object.defineProperty(e.languages.diff, "PREFIXES", {
                        value: t
                    })
                }(n),
                function(e) {
                    function t(e, t) {
                        return "___" + e.toUpperCase() + t + "___"
                    }
                    Object.defineProperties(e.languages["markup-templating"] = {}, {
                        buildPlaceholders: {
                            value: function(n, a, r, i) {
                                if (n.language === a) {
                                    var s = n.tokenStack = [];
                                    n.code = n.code.replace(r, (function(e) {
                                        if ("function" == typeof i && !i(e)) return e;
                                        for (var r, o = s.length; - 1 !== n.code.indexOf(r = t(a, o));) ++o;
                                        return s[o] = e, r
                                    })), n.grammar = e.languages.markup
                                }
                            }
                        },
                        tokenizePlaceholders: {
                            value: function(n, a) {
                                if (n.language === a && n.tokenStack) {
                                    n.grammar = e.languages[a];
                                    var r = 0,
                                        i = Object.keys(n.tokenStack);
                                    ! function s(o) {
                                        for (var l = 0; l < o.length && !(r >= i.length); l++) {
                                            var c = o[l];
                                            if ("string" == typeof c || c.content && "string" == typeof c.content) {
                                                var u = i[r],
                                                    d = n.tokenStack[u],
                                                    p = "string" == typeof c ? c : c.content,
                                                    f = t(a, u),
                                                    g = p.indexOf(f);
                                                if (-1 < g) {
                                                    ++r;
                                                    var m = p.substring(0, g),
                                                        h = new e.Token(a, e.tokenize(d, n.grammar), "language-" + a, d),
                                                        v = p.substring(g + f.length),
                                                        b = [];
                                                    m && b.push.apply(b, s([m])), b.push(h), v && b.push.apply(b, s([v])), "string" == typeof c ? o.splice.apply(o, [l, 1].concat(b)) : c.content = b
                                                }
                                            } else c.content && s(c.content)
                                        }
                                        return o
                                    }(n.tokens)
                                }
                            }
                        }
                    })
                }(n),
                function(e) {
                    e.languages.php = e.languages.extend("clike", {
                        keyword: /\b(?:__halt_compiler|abstract|and|array|as|break|callable|case|catch|class|clone|const|continue|declare|default|die|do|echo|else|elseif|empty|enddeclare|endfor|endforeach|endif|endswitch|endwhile|eval|exit|extends|final|finally|for|foreach|function|global|goto|if|implements|include|include_once|instanceof|insteadof|interface|isset|list|namespace|new|or|parent|print|private|protected|public|require|require_once|return|static|switch|throw|trait|try|unset|use|var|while|xor|yield)\b/i,
                        boolean: {
                            pattern: /\b(?:false|true)\b/i,
                            alias: "constant"
                        },
                        constant: [/\b[A-Z_][A-Z0-9_]*\b/, /\b(?:null)\b/i],
                        comment: {
                            pattern: /(^|[^\\])(?:\/\*[\s\S]*?\*\/|\/\/.*)/,
                            lookbehind: !0
                        }
                    }), e.languages.insertBefore("php", "string", {
                        "shell-comment": {
                            pattern: /(^|[^\\])#.*/,
                            lookbehind: !0,
                            alias: "comment"
                        }
                    }), e.languages.insertBefore("php", "comment", {
                        delimiter: {
                            pattern: /\?>$|^<\?(?:php(?=\s)|=)?/i,
                            alias: "important"
                        }
                    }), e.languages.insertBefore("php", "keyword", {
                        variable: /\$+(?:\w+\b|(?={))/i,
                        package: {
                            pattern: /(\\|namespace\s+|use\s+)[\w\\]+/,
                            lookbehind: !0,
                            inside: {
                                punctuation: /\\/
                            }
                        }
                    }), e.languages.insertBefore("php", "operator", {
                        property: {
                            pattern: /(->)[\w]+/,
                            lookbehind: !0
                        }
                    });
                    var t = {
                        pattern: /{\$(?:{(?:{[^{}]+}|[^{}]+)}|[^{}])+}|(^|[^\\{])\$+(?:\w+(?:\[.+?]|->\w+)*)/,
                        lookbehind: !0,
                        inside: e.languages.php
                    };
                    e.languages.insertBefore("php", "string", {
                        "nowdoc-string": {
                            pattern: /<<<'([^']+)'(?:\r\n?|\n)(?:.*(?:\r\n?|\n))*?\1;/,
                            greedy: !0,
                            alias: "string",
                            inside: {
                                delimiter: {
                                    pattern: /^<<<'[^']+'|[a-z_]\w*;$/i,
                                    alias: "symbol",
                                    inside: {
                                        punctuation: /^<<<'?|[';]$/
                                    }
                                }
                            }
                        },
                        "heredoc-string": {
                            pattern: /<<<(?:"([^"]+)"(?:\r\n?|\n)(?:.*(?:\r\n?|\n))*?\1;|([a-z_]\w*)(?:\r\n?|\n)(?:.*(?:\r\n?|\n))*?\2;)/i,
                            greedy: !0,
                            alias: "string",
                            inside: {
                                delimiter: {
                                    pattern: /^<<<(?:"[^"]+"|[a-z_]\w*)|[a-z_]\w*;$/i,
                                    alias: "symbol",
                                    inside: {
                                        punctuation: /^<<<"?|[";]$/
                                    }
                                },
                                interpolation: t
                            }
                        },
                        "single-quoted-string": {
                            pattern: /'(?:\\[\s\S]|[^\\'])*'/,
                            greedy: !0,
                            alias: "string"
                        },
                        "double-quoted-string": {
                            pattern: /"(?:\\[\s\S]|[^\\"])*"/,
                            greedy: !0,
                            alias: "string",
                            inside: {
                                interpolation: t
                            }
                        }
                    }), delete e.languages.php.string, e.hooks.add("before-tokenize", (function(t) {
                        /<\?/.test(t.code) && e.languages["markup-templating"].buildPlaceholders(t, "php", /<\?(?:[^"'/#]|\/(?![*/])|("|')(?:\\[\s\S]|(?!\1)[^\\])*\1|(?:\/\/|#)(?:[^?\n\r]|\?(?!>))*|\/\*[\s\S]*?(?:\*\/|$))*?(?:\?>|$)/gi)
                    })), e.hooks.add("after-tokenize", (function(t) {
                        e.languages["markup-templating"].tokenizePlaceholders(t, "php")
                    }))
                }(n), n.languages.insertBefore("php", "variable", {
                    this: /\$this\b/,
                    global: /\$(?:_(?:SERVER|GET|POST|FILES|REQUEST|SESSION|ENV|COOKIE)|GLOBALS|HTTP_RAW_POST_DATA|argc|argv|php_errormsg|http_response_header)\b/,
                    scope: {
                        pattern: /\b[\w\\]+::/,
                        inside: {
                            keyword: /static|self|parent/,
                            punctuation: /::|\\/
                        }
                    }
                }),
                function() {
                    if ("undefined" != typeof self && self.Prism && self.document && document.querySelector) {
                        var e, t = function() {
                                if (void 0 === e) {
                                    var t = document.createElement("div");
                                    t.style.fontSize = "13px", t.style.lineHeight = "1.5", t.style.padding = 0, t.style.border = 0, t.innerHTML = "&nbsp;<br />&nbsp;", document.body.appendChild(t), e = 38 === t.offsetHeight, document.body.removeChild(t)
                                }
                                return e
                            },
                            a = 0;
                        n.hooks.add("before-sanity-check", (function(e) {
                            var t = e.element.parentNode,
                                n = t && t.getAttribute("data-line");
                            if (t && n && /pre/i.test(t.nodeName)) {
                                var a = 0;
                                r(".line-highlight", t).forEach((function(e) {
                                    a += e.textContent.length, e.parentNode.removeChild(e)
                                })), a && /^( \n)+$/.test(e.code.slice(-a)) && (e.code = e.code.slice(0, -a))
                            }
                        })), n.hooks.add("complete", (function e(t) {
                            var r = t.element.parentNode,
                                s = r && r.getAttribute("data-line");
                            if (r && s && /pre/i.test(r.nodeName)) {
                                clearTimeout(a);
                                var c = n.plugins.lineNumbers,
                                    u = t.plugins && t.plugins.lineNumbers;
                                i(r, "line-numbers") && c && !u ? n.hooks.add("line-numbers", e) : (o(r, s)(), a = setTimeout(l, 1))
                            }
                        })), window.addEventListener("hashchange", l), window.addEventListener("resize", (function() {
                            var e = [];
                            r("pre[data-line]").forEach((function(t) {
                                e.push(o(t))
                            })), e.forEach(s)
                        }))
                    }

                    function r(e, t) {
                        return Array.prototype.slice.call((t || document).querySelectorAll(e))
                    }

                    function i(e, t) {
                        return t = " " + t + " ", -1 < (" " + e.className + " ").replace(/[\n\t]/g, " ").indexOf(t)
                    }

                    function s(e) {
                        e()
                    }

                    function o(e, a, r) {
                        var o = (a = "string" == typeof a ? a : e.getAttribute("data-line")).replace(/\s+/g, "").split(","),
                            l = +e.getAttribute("data-line-offset") || 0,
                            c = (t() ? parseInt : parseFloat)(getComputedStyle(e).lineHeight),
                            u = i(e, "line-numbers"),
                            d = u ? e : e.querySelector("code") || e,
                            p = [];
                        return o.forEach((function(t) {
                                var a = t.split("-"),
                                    i = +a[0],
                                    s = +a[1] || i,
                                    o = e.querySelector('.line-highlight[data-range="' + t + '"]') || document.createElement("div");
                                if (p.push((function() {
                                        o.setAttribute("aria-hidden", "true"), o.setAttribute("data-range", t), o.className = (r || "") + " line-highlight"
                                    })), u && n.plugins.lineNumbers) {
                                    var f = n.plugins.lineNumbers.getLine(e, i),
                                        g = n.plugins.lineNumbers.getLine(e, s);
                                    if (f) {
                                        var m = f.offsetTop + "px";
                                        p.push((function() {
                                            o.style.top = m
                                        }))
                                    }
                                    if (g) {
                                        var h = g.offsetTop - f.offsetTop + g.offsetHeight + "px";
                                        p.push((function() {
                                            o.style.height = h
                                        }))
                                    }
                                } else p.push((function() {
                                    o.setAttribute("data-start", i), i < s && o.setAttribute("data-end", s), o.style.top = (i - l - 1) * c + "px", o.textContent = new Array(s - i + 2).join(" \n")
                                }));
                                p.push((function() {
                                    d.appendChild(o)
                                }))
                            })),
                            function() {
                                p.forEach(s)
                            }
                    }

                    function l() {
                        var e = location.hash.slice(1);
                        r(".temporary.line-highlight").forEach((function(e) {
                            e.parentNode.removeChild(e)
                        }));
                        var t = (e.match(/\.([\d,-]+)$/) || [, ""])[1];
                        if (t && !document.getElementById(e)) {
                            var n = e.slice(0, e.lastIndexOf(".")),
                                a = document.getElementById(n);
                            a && (a.hasAttribute("data-line") || a.setAttribute("data-line", ""), o(a, t, "temporary ")(), document.querySelector(".temporary.line-highlight").scrollIntoView())
                        }
                    }
                }(),
                function() {
                    if (("undefined" == typeof self || self.Prism) && (void 0 === t || t.Prism)) {
                        var e = /\b([a-z]{3,7}:\/\/|tel:)[\w\-+%~/.:=&@]+(?:\?[\w\-+%~/.:=?&!$'()*,;@]*)?(?:#[\w\-+%~/.:#=?&!$'()*,;@]*)?/,
                            a = /\b\S+@[\w.]+[a-z]{2}/,
                            r = /\[([^\]]+)]\(([^)]+)\)/,
                            i = ["comment", "url", "attr-value", "string"];
                        n.plugins.autolinker = {
                            processGrammar: function(t) {
                                t && !t["url-link"] && (n.languages.DFS(t, (function(t, s, o) {
                                    -1 < i.indexOf(o) && !Array.isArray(s) && (s.pattern || (s = this[t] = {
                                        pattern: s
                                    }), s.inside = s.inside || {}, "comment" == o && (s.inside["md-link"] = r), "attr-value" == o ? n.languages.insertBefore("inside", "punctuation", {
                                        "url-link": e
                                    }, s) : s.inside["url-link"] = e, s.inside["email-link"] = a)
                                })), t["url-link"] = e, t["email-link"] = a)
                            }
                        }, n.hooks.add("before-highlight", (function(e) {
                            n.plugins.autolinker.processGrammar(e.grammar)
                        })), n.hooks.add("wrap", (function(e) {
                            if (/-link$/.test(e.type)) {
                                e.tag = "a";
                                var t = e.content;
                                if ("email-link" == e.type && 0 != t.indexOf("mailto:")) t = "mailto:" + t;
                                else if ("md-link" == e.type) {
                                    var n = e.content.match(r);
                                    t = n[2], e.content = n[1]
                                }
                                e.attributes.href = t;
                                try {
                                    e.content = decodeURIComponent(e.content)
                                } catch (e) {}
                            }
                        }))
                    }
                }(),
                function() {
                    if (("undefined" == typeof self || self.Prism) && (void 0 === t || t.Prism)) {
                        var e = {
                                pattern: /(.)\bdata:[^\/]+\/[^,]+,(?:(?!\1)[\s\S]|\\\1)+(?=\1)/,
                                lookbehind: !0,
                                inside: {
                                    "language-css": {
                                        pattern: /(data:[^\/]+\/(?:[^+,]+\+)?css,)[\s\S]+/,
                                        lookbehind: !0
                                    },
                                    "language-javascript": {
                                        pattern: /(data:[^\/]+\/(?:[^+,]+\+)?javascript,)[\s\S]+/,
                                        lookbehind: !0
                                    },
                                    "language-json": {
                                        pattern: /(data:[^\/]+\/(?:[^+,]+\+)?json,)[\s\S]+/,
                                        lookbehind: !0
                                    },
                                    "language-markup": {
                                        pattern: /(data:[^\/]+\/(?:[^+,]+\+)?(?:html|xml),)[\s\S]+/,
                                        lookbehind: !0
                                    }
                                }
                            },
                            a = ["url", "attr-value", "string"];
                        n.plugins.dataURIHighlight = {
                            processGrammar: function(t) {
                                t && !t["data-uri"] && (n.languages.DFS(t, (function(t, r, i) {
                                    -1 < a.indexOf(i) && !Array.isArray(r) && (r.pattern || (r = this[t] = {
                                        pattern: r
                                    }), r.inside = r.inside || {}, "attr-value" == i ? n.languages.insertBefore("inside", r.inside["url-link"] ? "url-link" : "punctuation", {
                                        "data-uri": e
                                    }, r) : r.inside["url-link"] ? n.languages.insertBefore("inside", "url-link", {
                                        "data-uri": e
                                    }, r) : r.inside["data-uri"] = e)
                                })), t["data-uri"] = e)
                            }
                        }, n.hooks.add("before-highlight", (function(t) {
                            if (e.pattern.test(t.code))
                                for (var a in e.inside)
                                    if (e.inside.hasOwnProperty(a) && !e.inside[a].inside && e.inside[a].pattern.test(t.code)) {
                                        var r = a.match(/^language-(.+)/)[1];
                                        n.languages[r] && (e.inside[a].inside = {
                                            rest: (i = n.languages[r], n.plugins.autolinker && n.plugins.autolinker.processGrammar(i), i)
                                        })
                                    } var i;
                            n.plugins.dataURIHighlight.processGrammar(t.grammar)
                        }))
                    }
                }(),
                function() {
                    if ("undefined" != typeof self && self.Prism || void 0 !== t && t.Prism) {
                        var e = function(e) {
                                return e
                            },
                            a = {
                                classMap: e,
                                prefixString: ""
                            };
                        n.plugins.customClass = {
                            map: function(e) {
                                a.classMap = "function" == typeof e ? e : function(t) {
                                    return e[t] || t
                                }
                            },
                            prefix: function(e) {
                                a.prefixString = e
                            }
                        }, n.hooks.add("wrap", (function(t) {
                            (a.classMap !== e || a.prefixString) && (t.classes = t.classes.map((function(e) {
                                return a.prefixString + a.classMap(e, t.language)
                            })))
                        }))
                    }
                }(), "undefined" != typeof self && self.Prism && self.document && document.querySelector && (self.Prism.fileHighlight = function(e) {
                    e = e || document;
                    var t = {
                        js: "javascript",
                        py: "python",
                        rb: "ruby",
                        ps1: "powershell",
                        psm1: "powershell",
                        sh: "bash",
                        bat: "batch",
                        h: "c",
                        tex: "latex"
                    };
                    Array.prototype.slice.call(e.querySelectorAll("pre[data-src]")).forEach((function(e) {
                        if (!e.hasAttribute("data-src-loaded")) {
                            for (var a, r = e.getAttribute("data-src"), i = e, s = /\blang(?:uage)?-([\w-]+)\b/i; i && !s.test(i.className);) i = i.parentNode;
                            if (i && (a = (e.className.match(s) || [, ""])[1]), !a) {
                                var o = (r.match(/\.(\w+)$/) || [, ""])[1];
                                a = t[o] || o
                            }
                            var l = document.createElement("code");
                            l.className = "language-" + a, e.textContent = "", l.textContent = "Loading…", e.appendChild(l);
                            var c = new XMLHttpRequest;
                            c.open("GET", r, !0), c.onreadystatechange = function() {
                                4 == c.readyState && (c.status < 400 && c.responseText ? (l.textContent = c.responseText, n.highlightElement(l), e.setAttribute("data-src-loaded", "")) : 400 <= c.status ? l.textContent = "✖ Error " + c.status + " while fetching file: " + c.statusText : l.textContent = "✖ Error: File does not exist or is empty")
                            }, c.send(null)
                        }
                    }))
                }, document.addEventListener("DOMContentLoaded", (function() {
                    self.Prism.fileHighlight()
                }))),
                function() {
                    if ("undefined" != typeof self && self.Prism && self.document) {
                        var e = [],
                            t = {},
                            a = function() {};
                        n.plugins.toolbar = {};
                        var r = n.plugins.toolbar.registerButton = function(n, a) {
                                var r;
                                r = "function" == typeof a ? a : function(e) {
                                    var t;
                                    return "function" == typeof a.onClick ? ((t = document.createElement("button")).type = "button", t.addEventListener("click", (function() {
                                        a.onClick.call(this, e)
                                    }))) : "string" == typeof a.url ? (t = document.createElement("a")).href = a.url : t = document.createElement("span"), a.className && t.classList.add(a.className), t.textContent = a.text, t
                                }, n in t ? console.warn('There is a button with the key "' + n + '" registered already.') : e.push(t[n] = r)
                            },
                            i = n.plugins.toolbar.hook = function(n) {
                                var r = n.element.parentNode;
                                if (r && /pre/i.test(r.nodeName) && !r.parentNode.classList.contains("code-toolbar")) {
                                    var i = document.createElement("div");
                                    i.classList.add("code-toolbar"), r.parentNode.insertBefore(i, r), i.appendChild(r);
                                    var s = document.createElement("div");
                                    s.classList.add("toolbar"), document.body.hasAttribute("data-toolbar-order") && (e = document.body.getAttribute("data-toolbar-order").split(",").map((function(e) {
                                        return t[e] || a
                                    }))), e.forEach((function(e) {
                                        var t = e(n);
                                        if (t) {
                                            var a = document.createElement("div");
                                            a.classList.add("toolbar-item"), a.appendChild(t), s.appendChild(a)
                                        }
                                    })), i.appendChild(s)
                                }
                            };
                        r("label", (function(e) {
                            var t = e.element.parentNode;
                            if (t && /pre/i.test(t.nodeName) && t.hasAttribute("data-label")) {
                                var n, a, r = t.getAttribute("data-label");
                                try {
                                    a = document.querySelector("template#" + r)
                                } catch (e) {}
                                return a ? n = a.content : (t.hasAttribute("data-url") ? (n = document.createElement("a")).href = t.getAttribute("data-url") : n = document.createElement("span"), n.textContent = r), n
                            }
                        })), n.hooks.add("complete", i)
                    }
                }(), "undefined" != typeof self && !self.Prism || void 0 !== t && !t.Prism || n.hooks.add("wrap", (function(e) {
                    "keyword" === e.type && e.classes.push("keyword-" + e.content)
                })),
                function() {
                    if ("undefined" != typeof self && void 0 !== n && "undefined" != typeof document) {
                        var e = /<\/?(?!\d)[^\s>\/=$<%]+(?:\s(?:\s*[^\s>\/=]+(?:\s*=\s*(?:"[^"]*"|'[^']*'|[^\s'">=]+(?=[\s>]))|(?=[\s/>])))+)?\s*\/?>/g,
                            t = /^#?(?=(?:[\da-f]{1,2}){3,4}$)([\da-f][\da-f]?)([\da-f][\da-f]?)([\da-f][\da-f]?)([\da-f][\da-f]?)?$/i,
                            a = [function(e) {
                                var n = t.exec(e);
                                if (n) {
                                    var a = e.length <= 4 ? 1 / 15 : 1 / 255;
                                    return "rgba(" + n.slice(1, 4).map((function(e) {
                                        return String(Math.round(parseInt(e, 16) * a * 255))
                                    })).join(",") + "," + (void 0 === n[4] ? "1" : (parseInt(n[4], 16) * a).toFixed(3)) + ")"
                                }
                            }, function(e) {
                                var t = (new Option).style;
                                return t.color = e, t.color ? e : void 0
                            }];
                        n.hooks.add("wrap", (function(t) {
                            if ("color" === t.type || "hexcode" === t.type) {
                                for (var n, r = t.content, i = r.split(e).join(""), s = 0, o = a.length; s < o && !n; s++) n = a[s](i);
                                if (!n) return;
                                var l = '<span class="inline-color" style="background-color:' + n + ';"></span>';
                                t.content = l + r
                            }
                        }))
                    }
                }(),
                function() {
                    if ("undefined" != typeof self && self.Prism && self.document && document.createElement) {
                        var e = {
                                javascript: "clike",
                                actionscript: "javascript",
                                arduino: "cpp",
                                aspnet: ["markup", "csharp"],
                                bison: "c",
                                c: "clike",
                                csharp: "clike",
                                cpp: "c",
                                coffeescript: "javascript",
                                crystal: "ruby",
                                "css-extras": "css",
                                d: "clike",
                                dart: "clike",
                                django: "markup-templating",
                                ejs: ["javascript", "markup-templating"],
                                etlua: ["lua", "markup-templating"],
                                erb: ["ruby", "markup-templating"],
                                fsharp: "clike",
                                "firestore-security-rules": "clike",
                                flow: "javascript",
                                ftl: "markup-templating",
                                glsl: "clike",
                                gml: "clike",
                                go: "clike",
                                groovy: "clike",
                                haml: "ruby",
                                handlebars: "markup-templating",
                                haxe: "clike",
                                java: "clike",
                                javadoc: ["markup", "java", "javadoclike"],
                                jolie: "clike",
                                jsdoc: ["javascript", "javadoclike"],
                                "js-extras": "javascript",
                                "js-templates": "javascript",
                                jsonp: "json",
                                json5: "json",
                                kotlin: "clike",
                                less: "css",
                                lilypond: "scheme",
                                markdown: "markup",
                                "markup-templating": "markup",
                                n4js: "javascript",
                                nginx: "clike",
                                objectivec: "c",
                                opencl: "cpp",
                                parser: "markup",
                                php: ["clike", "markup-templating"],
                                phpdoc: ["php", "javadoclike"],
                                "php-extras": "php",
                                plsql: "sql",
                                processing: "clike",
                                protobuf: "clike",
                                pug: ["markup", "javascript"],
                                qore: "clike",
                                jsx: ["markup", "javascript"],
                                tsx: ["jsx", "typescript"],
                                reason: "clike",
                                ruby: "clike",
                                sass: "css",
                                scss: "css",
                                scala: "java",
                                "shell-session": "bash",
                                smarty: "markup-templating",
                                solidity: "clike",
                                soy: "markup-templating",
                                sparql: "turtle",
                                sqf: "clike",
                                swift: "clike",
                                tap: "yaml",
                                textile: "markup",
                                tt2: ["clike", "markup-templating"],
                                twig: "markup",
                                typescript: "javascript",
                                "t4-cs": ["t4-templating", "csharp"],
                                "t4-vb": ["t4-templating", "visual-basic"],
                                vala: "clike",
                                vbnet: "basic",
                                velocity: "markup",
                                wiki: "markup",
                                xeora: "markup",
                                xquery: "markup"
                            },
                            t = {
                                html: "markup",
                                xml: "markup",
                                svg: "markup",
                                mathml: "markup",
                                js: "javascript",
                                g4: "antlr4",
                                adoc: "asciidoc",
                                shell: "bash",
                                rbnf: "bnf",
                                cs: "csharp",
                                dotnet: "csharp",
                                coffee: "coffeescript",
                                jinja2: "django",
                                "dns-zone": "dns-zone-file",
                                dockerfile: "docker",
                                gamemakerlanguage: "gml",
                                hs: "haskell",
                                tex: "latex",
                                context: "latex",
                                ly: "lilypond",
                                emacs: "lisp",
                                elisp: "lisp",
                                "emacs-lisp": "lisp",
                                md: "markdown",
                                moon: "moonscript",
                                n4jsd: "n4js",
                                objectpascal: "pascal",
                                px: "pcaxis",
                                py: "python",
                                robot: "robot-framework",
                                rb: "ruby",
                                rq: "sparql",
                                trig: "turtle",
                                ts: "typescript",
                                t4: "t4-cs",
                                vb: "visual-basic",
                                xeoracube: "xeora",
                                yml: "yaml"
                            },
                            a = {},
                            r = "components/",
                            i = n.util.currentScript();
                        if (i) {
                            var s = /\bplugins\/autoloader\/prism-autoloader\.(?:min\.)js$/i,
                                o = /[\w-]+\.(?:min\.)js$/i;
                            if (i.hasAttribute("data-autoloader-path")) r = i.getAttribute("data-autoloader-path").trim().replace(/\/?$/, "/");
                            else {
                                var l = i.src;
                                s.test(l) ? r = l.replace(s, "components/") : o.test(l) && (r = l.replace(o, "components/"))
                            }
                        }
                        var c = n.plugins.autoloader = {
                            languages_path: r,
                            use_minified: !0,
                            loadLanguages: u
                        };
                        n.hooks.add("complete", (function(e) {
                            e.element && e.language && !e.grammar && "none" !== e.language && function(e, a) {
                                e in t && (e = t[e]);
                                var r = a.getAttribute("data-dependencies"),
                                    i = a.parentElement;
                                !r && i && "pre" === i.tagName.toLowerCase() && (r = i.getAttribute("data-dependencies")), u(r = r ? r.split(/\s*,\s*/g) : [], (function() {
                                    d(e, (function() {
                                        n.highlightElement(a)
                                    }))
                                }))
                            }(e.language, e.element)
                        }))
                    }

                    function u(e, t, n) {
                        "string" == typeof e && (e = [e]);
                        var a = e.length,
                            r = 0,
                            i = !1;

                        function s() {
                            i || ++r === a && t && t(e)
                        }
                        0 !== a ? e.forEach((function(e) {
                            d(e, s, (function() {
                                i || (i = !0, n && n(e))
                            }))
                        })) : t && setTimeout(t, 0)
                    }

                    function d(r, i, s) {
                        var o = 0 <= r.indexOf("!");
                        r = r.replace("!", ""), r = t[r] || r;
                        var l = function() {
                                var e = a[r];
                                e || (e = a[r] = {
                                    callbacks: []
                                }), e.callbacks.push({
                                    success: i,
                                    error: s
                                }), !o && n.languages[r] ? p(r, "success") : !o && e.error ? p(r, "error") : !o && e.loading || (e.loading = !0, function(e, t, n) {
                                    var a = document.createElement("script");
                                    a.src = e, a.async = !0, a.onload = function() {
                                        document.body.removeChild(a), t && t()
                                    }, a.onerror = function() {
                                        document.body.removeChild(a), n && n()
                                    }, document.body.appendChild(a)
                                }(function(e) {
                                    return c.languages_path + "prism-" + e + (c.use_minified ? ".min" : "") + ".js"
                                }(r), (function() {
                                    e.loading = !1, p(r, "success")
                                }), (function() {
                                    e.loading = !1, e.error = !0, p(r, "error")
                                })))
                            },
                            d = e[r];
                        d && d.length ? u(d, l, s) : l()
                    }

                    function p(e, t) {
                        if (a[e]) {
                            for (var n = a[e].callbacks, r = 0, i = n.length; r < i; r++) {
                                var s = n[r][t];
                                s && setTimeout(s, 0)
                            }
                            n.length = 0
                        }
                    }
                }(),
                function() {
                    if ("undefined" != typeof self && self.Prism && self.document) {
                        var e = /(?:^|\s)command-line(?:\s|$)/;
                        n.hooks.add("before-highlight", (function(t) {
                            var n = t.vars = t.vars || {},
                                a = n["command-line"] = n["command-line"] || {};
                            if (!a.complete && t.code) {
                                var r = t.element.parentNode;
                                if (r && /pre/i.test(r.nodeName) && (e.test(r.className) || e.test(t.element.className)))
                                    if (t.element.querySelector(".command-line-prompt")) a.complete = !0;
                                    else {
                                        var i = t.code.split("\n");
                                        a.numberOfLines = i.length;
                                        var s = a.outputLines = [],
                                            o = r.getAttribute("data-output"),
                                            l = r.getAttribute("data-filter-output");
                                        if (o || "" === o) {
                                            o = o.split(",");
                                            for (var c = 0; c < o.length; c++) {
                                                var u = o[c].split("-"),
                                                    d = parseInt(u[0], 10),
                                                    p = 2 === u.length ? parseInt(u[1], 10) : d;
                                                if (!isNaN(d) && !isNaN(p)) {
                                                    d < 1 && (d = 1), p > i.length && (p = i.length), p--;
                                                    for (var f = --d; f <= p; f++) s[f] = i[f], i[f] = ""
                                                }
                                            }
                                        } else if (l)
                                            for (c = 0; c < i.length; c++) 0 === i[c].indexOf(l) && (s[c] = i[c].slice(l.length), i[c] = "");
                                        t.code = i.join("\n")
                                    }
                                else a.complete = !0
                            } else a.complete = !0
                        })), n.hooks.add("before-insert", (function(e) {
                            var t = e.vars = e.vars || {},
                                n = t["command-line"] = t["command-line"] || {};
                            if (!n.complete) {
                                for (var a = e.highlightedCode.split("\n"), r = 0, i = (n.outputLines || []).length; r < i; r++) n.outputLines.hasOwnProperty(r) && (a[r] = n.outputLines[r]);
                                e.highlightedCode = a.join("\n")
                            }
                        })), n.hooks.add("complete", (function(t) {
                            var n = t.vars = t.vars || {},
                                a = n["command-line"] = n["command-line"] || {};
                            if (!a.complete) {
                                var r = t.element.parentNode;
                                e.test(t.element.className) && (t.element.className = t.element.className.replace(e, " ")), e.test(r.className) || (r.className += " command-line");
                                var i = function(e, t) {
                                        return (r.getAttribute(e) || t).replace(/"/g, "&quot")
                                    },
                                    s = new Array((a.numberOfLines || 0) + 1),
                                    o = i("data-prompt", "");
                                if ("" !== o) s = s.join('<span data-prompt="' + o + '"></span>');
                                else {
                                    var l = i("data-user", "user"),
                                        c = i("data-host", "localhost");
                                    s = s.join('<span data-user="' + l + '" data-host="' + c + '"></span>')
                                }
                                var u = document.createElement("span");
                                u.className = "command-line-prompt", u.innerHTML = s;
                                for (var d = 0, p = (a.outputLines || []).length; d < p; d++)
                                    if (a.outputLines.hasOwnProperty(d)) {
                                        var f = u.children[d];
                                        f.removeAttribute("data-user"), f.removeAttribute("data-host"), f.removeAttribute("data-prompt")
                                    } t.element.insertBefore(u, t.element.firstChild), a.complete = !0
                            }
                        }))
                    }
                }(),
                function() {
                    var t = Object.assign || function(e, t) {
                        for (var n in t) t.hasOwnProperty(n) && (e[n] = t[n]);
                        return e
                    };

                    function a(e) {
                        this.defaults = t({}, e)
                    }

                    function r(e) {
                        for (var t = 0, n = 0; n < e.length; ++n) e.charCodeAt(n) == "\t".charCodeAt(0) && (t += 3);
                        return e.length + t
                    }
                    a.prototype = {
                        setDefaults: function(e) {
                            this.defaults = t(this.defaults, e)
                        },
                        normalize: function(e, n) {
                            for (var a in n = t(this.defaults, n)) {
                                var r = a.replace(/-(\w)/g, (function(e, t) {
                                    return t.toUpperCase()
                                }));
                                "normalize" !== a && "setDefaults" !== r && n[a] && this[r] && (e = this[r].call(this, e, n[a]))
                            }
                            return e
                        },
                        leftTrim: function(e) {
                            return e.replace(/^\s+/, "")
                        },
                        rightTrim: function(e) {
                            return e.replace(/\s+$/, "")
                        },
                        tabsToSpaces: function(e, t) {
                            return t = 0 | t || 4, e.replace(/\t/g, new Array(++t).join(" "))
                        },
                        spacesToTabs: function(e, t) {
                            return t = 0 | t || 4, e.replace(RegExp(" {" + t + "}", "g"), "\t")
                        },
                        removeTrailing: function(e) {
                            return e.replace(/\s*?$/gm, "")
                        },
                        removeInitialLineFeed: function(e) {
                            return e.replace(/^(?:\r?\n|\r)/, "")
                        },
                        removeIndent: function(e) {
                            var t = e.match(/^[^\S\n\r]*(?=\S)/gm);
                            return t && t[0].length ? (t.sort((function(e, t) {
                                return e.length - t.length
                            })), t[0].length ? e.replace(RegExp("^" + t[0], "gm"), "") : e) : e
                        },
                        indent: function(e, t) {
                            return e.replace(/^[^\S\n\r]*(?=\S)/gm, new Array(++t).join("\t") + "$&")
                        },
                        breakLines: function(e, t) {
                            t = !0 === t ? 80 : 0 | t || 80;
                            for (var n = e.split("\n"), a = 0; a < n.length; ++a)
                                if (!(r(n[a]) <= t)) {
                                    for (var i = n[a].split(/(\s+)/g), s = 0, o = 0; o < i.length; ++o) {
                                        var l = r(i[o]);
                                        t < (s += l) && (i[o] = "\n" + i[o], s = l)
                                    }
                                    n[a] = i.join("")
                                } return n.join("\n")
                        }
                    }, e.exports && (e.exports = a), void 0 !== n && (n.plugins.NormalizeWhitespace = new a({
                        "remove-trailing": !0,
                        "remove-indent": !0,
                        "left-trim": !0,
                        "right-trim": !0
                    }), n.hooks.add("before-sanity-check", (function(e) {
                        var t = n.plugins.NormalizeWhitespace;
                        if (!e.settings || !1 !== e.settings["whitespace-normalization"])
                            if (e.element && e.element.parentNode || !e.code) {
                                var a = e.element.parentNode,
                                    r = /(?:^|\s)no-whitespace-normalization(?:\s|$)/;
                                if (e.code && a && "pre" === a.nodeName.toLowerCase() && !r.test(a.className) && !r.test(e.element.className)) {
                                    for (var i = a.childNodes, s = "", o = "", l = !1, c = 0; c < i.length; ++c) {
                                        var u = i[c];
                                        u == e.element ? l = !0 : "#text" === u.nodeName && (l ? o += u.nodeValue : s += u.nodeValue, a.removeChild(u), --c)
                                    }
                                    if (e.element.children.length && n.plugins.KeepMarkup) {
                                        var d = s + e.element.innerHTML + o;
                                        e.element.innerHTML = t.normalize(d, e.settings), e.code = e.element.textContent
                                    } else e.code = s + e.code + o, e.code = t.normalize(e.code, e.settings)
                                }
                            } else e.code = t.normalize(e.code, e.settings)
                    })))
                }(),
                function() {
                    if (("undefined" == typeof self || self.Prism) && (void 0 === t || t.Prism)) {
                        var e = {
                            tab: /\t/,
                            crlf: /\r\n/,
                            lf: /\n/,
                            cr: /\r/,
                            space: / /
                        };
                        n.hooks.add("before-highlight", (function(e) {
                            r(e.grammar)
                        }))
                    }

                    function a(e, t) {
                        var i = e[t];
                        switch (n.util.type(i)) {
                            case "RegExp":
                                var s = {};
                                e[t] = {
                                    pattern: i,
                                    inside: s
                                }, r(s);
                                break;
                            case "Array":
                                for (var o = 0, l = i.length; o < l; o++) a(i, o);
                                break;
                            default:
                                r(s = i.inside || (i.inside = {}))
                        }
                    }

                    function r(t) {
                        if (t && !t.tab) {
                            for (var n in e) e.hasOwnProperty(n) && (t[n] = e[n]);
                            for (var n in t) t.hasOwnProperty(n) && !e[n] && ("rest" === n ? r(t.rest) : a(t, n))
                        }
                    }
                }(),
                function() {
                    if ("undefined" != typeof self && self.Prism && self.document)
                        if (n.plugins.toolbar) {
                            var e = {
                                html: "HTML",
                                xml: "XML",
                                svg: "SVG",
                                mathml: "MathML",
                                css: "CSS",
                                clike: "C-like",
                                js: "JavaScript",
                                abap: "ABAP",
                                abnf: "Augmented Backus–Naur form",
                                antlr4: "ANTLR4",
                                g4: "ANTLR4",
                                apacheconf: "Apache Configuration",
                                apl: "APL",
                                aql: "AQL",
                                arff: "ARFF",
                                asciidoc: "AsciiDoc",
                                adoc: "AsciiDoc",
                                asm6502: "6502 Assembly",
                                aspnet: "ASP.NET (C#)",
                                autohotkey: "AutoHotkey",
                                autoit: "AutoIt",
                                shell: "Bash",
                                basic: "BASIC",
                                bbcode: "BBcode",
                                bnf: "Backus–Naur form",
                                rbnf: "Routing Backus–Naur form",
                                csharp: "C#",
                                cs: "C#",
                                dotnet: "C#",
                                cpp: "C++",
                                cil: "CIL",
                                coffee: "CoffeeScript",
                                cmake: "CMake",
                                csp: "Content-Security-Policy",
                                "css-extras": "CSS Extras",
                                django: "Django/Jinja2",
                                jinja2: "Django/Jinja2",
                                "dns-zone-file": "DNS zone file",
                                "dns-zone": "DNS zone file",
                                dockerfile: "Docker",
                                ebnf: "Extended Backus–Naur form",
                                ejs: "EJS",
                                etlua: "Embedded Lua templating",
                                erb: "ERB",
                                fsharp: "F#",
                                "firestore-security-rules": "Firestore security rules",
                                ftl: "FreeMarker Template Language",
                                gcode: "G-code",
                                gdscript: "GDScript",
                                gedcom: "GEDCOM",
                                glsl: "GLSL",
                                gml: "GameMaker Language",
                                gamemakerlanguage: "GameMaker Language",
                                graphql: "GraphQL",
                                hs: "Haskell",
                                hcl: "HCL",
                                http: "HTTP",
                                hpkp: "HTTP Public-Key-Pins",
                                hsts: "HTTP Strict-Transport-Security",
                                ichigojam: "IchigoJam",
                                inform7: "Inform 7",
                                javadoc: "JavaDoc",
                                javadoclike: "JavaDoc-like",
                                javastacktrace: "Java stack trace",
                                jq: "JQ",
                                jsdoc: "JSDoc",
                                "js-extras": "JS Extras",
                                "js-templates": "JS Templates",
                                json: "JSON",
                                jsonp: "JSONP",
                                json5: "JSON5",
                                latex: "LaTeX",
                                tex: "TeX",
                                context: "ConTeXt",
                                lilypond: "LilyPond",
                                ly: "LilyPond",
                                emacs: "Lisp",
                                elisp: "Lisp",
                                "emacs-lisp": "Lisp",
                                lolcode: "LOLCODE",
                                md: "Markdown",
                                "markup-templating": "Markup templating",
                                matlab: "MATLAB",
                                mel: "MEL",
                                moon: "MoonScript",
                                n1ql: "N1QL",
                                n4js: "N4JS",
                                n4jsd: "N4JS",
                                "nand2tetris-hdl": "Nand To Tetris HDL",
                                nasm: "NASM",
                                nginx: "nginx",
                                nsis: "NSIS",
                                objectivec: "Objective-C",
                                ocaml: "OCaml",
                                opencl: "OpenCL",
                                parigp: "PARI/GP",
                                objectpascal: "Object Pascal",
                                pcaxis: "PC-Axis",
                                px: "PC-Axis",
                                php: "PHP",
                                phpdoc: "PHPDoc",
                                "php-extras": "PHP Extras",
                                plsql: "PL/SQL",
                                powershell: "PowerShell",
                                properties: ".properties",
                                protobuf: "Protocol Buffers",
                                py: "Python",
                                q: "Q (kdb+ database)",
                                jsx: "React JSX",
                                tsx: "React TSX",
                                renpy: "Ren'py",
                                rest: "reST (reStructuredText)",
                                "robot-framework": "Robot Framework",
                                robot: "Robot Framework",
                                rb: "Ruby",
                                sas: "SAS",
                                sass: "Sass (Sass)",
                                scss: "Sass (Scss)",
                                "shell-session": "Shell session",
                                solidity: "Solidity (Ethereum)",
                                soy: "Soy (Closure Template)",
                                sparql: "SPARQL",
                                rq: "SPARQL",
                                "splunk-spl": "Splunk SPL",
                                sqf: "SQF: Status Quo Function (Arma 3)",
                                sql: "SQL",
                                tap: "TAP",
                                toml: "TOML",
                                tt2: "Template Toolkit 2",
                                trig: "TriG",
                                ts: "TypeScript",
                                "t4-cs": "T4 Text Templates (C#)",
                                t4: "T4 Text Templates (C#)",
                                "t4-vb": "T4 Text Templates (VB)",
                                "t4-templating": "T4 templating",
                                vbnet: "VB.Net",
                                vhdl: "VHDL",
                                vim: "vim",
                                "visual-basic": "Visual Basic",
                                vb: "Visual Basic",
                                wasm: "WebAssembly",
                                wiki: "Wiki markup",
                                xeoracube: "XeoraCube",
                                xojo: "Xojo (REALbasic)",
                                xquery: "XQuery",
                                yaml: "YAML",
                                yml: "YAML"
                            };
                            n.plugins.toolbar.registerButton("show-language", (function(t) {
                                var n = t.element.parentNode;
                                if (n && /pre/i.test(n.nodeName)) {
                                    var a, r = n.getAttribute("data-language") || e[t.language] || ((a = t.language) ? (a.substring(0, 1).toUpperCase() + a.substring(1)).replace(/s(?=cript)/, "S") : a);
                                    if (r) {
                                        var i = document.createElement("span");
                                        return i.textContent = r, i
                                    }
                                }
                            }))
                        } else console.warn("Show Languages plugin loaded before Toolbar plugin.")
                }(),
                function() {
                    if ("undefined" != typeof self && self.Prism && self.document) {
                        var e = /(?:^|\s)match-braces(?:\s|$)/,
                            t = /(?:^|\s)brace-hover(?:\s|$)/,
                            a = /(?:^|\s)brace-selected(?:\s|$)/,
                            r = /(?:^|\s)no-brace-hover(?:\s|$)/,
                            i = /(?:^|\s)no-brace-select(?:\s|$)/,
                            s = {
                                "(": ")",
                                "[": "]",
                                "{": "}"
                            },
                            o = {
                                "(": "brace-round",
                                "[": "brace-square",
                                "{": "brace-curly"
                            },
                            l = 0,
                            c = /^(pair-\d+-)(open|close)$/;
                        n.hooks.add("complete", (function(t) {
                            var n = t.element,
                                r = n.parentElement;
                            if (r && "PRE" == r.tagName) {
                                for (var i = [], c = n; c; c = c.parentElement)
                                    if (e.test(c.className)) {
                                        i.push("(", "[", "{");
                                        break
                                    } if (0 != i.length) {
                                    r.__listenerAdded || (r.addEventListener("mousedown", (function() {
                                        var e = r.querySelector("code");
                                        Array.prototype.slice.call(e.querySelectorAll(".brace-selected")).forEach((function(e) {
                                            e.className = e.className.replace(a, " ")
                                        }))
                                    })), Object.defineProperty(r, "__listenerAdded", {
                                        value: !0
                                    }));
                                    var u = Array.prototype.slice.call(n.querySelectorAll("span.token.punctuation")),
                                        g = [];
                                    i.forEach((function(e) {
                                        for (var t = s[e], n = o[e], a = [], r = [], i = 0; i < u.length; i++) {
                                            var c = u[i];
                                            if (0 == c.childElementCount) {
                                                var m = c.textContent;
                                                m === e ? (g.push({
                                                    index: i,
                                                    open: !0,
                                                    element: c
                                                }), c.className += " " + n, c.className += " brace-open", r.push(i)) : m === t && (g.push({
                                                    index: i,
                                                    open: !1,
                                                    element: c
                                                }), c.className += " " + n, c.className += " brace-close", r.length && a.push([i, r.pop()]))
                                            }
                                        }
                                        a.forEach((function(e) {
                                            var t = "pair-" + l++ + "-",
                                                n = u[e[0]],
                                                a = u[e[1]];
                                            n.id = t + "open", a.id = t + "close", [n, a].forEach((function(e) {
                                                e.addEventListener("mouseenter", d), e.addEventListener("mouseleave", p), e.addEventListener("click", f)
                                            }))
                                        }))
                                    }));
                                    var m = 0;
                                    g.sort((function(e, t) {
                                        return e.index - t.index
                                    })), g.forEach((function(e) {
                                        e.open ? (e.element.className += " brace-level-" + (m % 12 + 1), m++) : (m = Math.max(0, m - 1), e.element.className += " brace-level-" + (m % 12 + 1))
                                    }))
                                }
                            }
                        }))
                    }

                    function u(e) {
                        var t = c.exec(e.id);
                        return document.querySelector("#" + t[1] + ("open" == t[2] ? "close" : "open"))
                    }

                    function d() {
                        for (var e = this.parentElement; e; e = e.parentElement)
                            if (r.test(e.className)) return;
                        [this, u(this)].forEach((function(e) {
                            e.className = (e.className.replace(t, " ") + " brace-hover").replace(/\s+/g, " ")
                        }))
                    }

                    function p() {
                        [this, u(this)].forEach((function(e) {
                            e.className = e.className.replace(t, " ")
                        }))
                    }

                    function f() {
                        for (var e = this.parentElement; e; e = e.parentElement)
                            if (i.test(e.className)) return;
                        [this, u(this)].forEach((function(e) {
                            e.className = (e.className.replace(a, " ") + " brace-selected").replace(/\s+/g, " ")
                        }))
                    }
                }()
        }).call(this, n(3))
    },
    27: function(e, t) {},
    3: function(e, t) {
        var n;
        n = function() {
            return this
        }();
        try {
            n = n || new Function("return this")()
        } catch (e) {
            "object" == typeof window && (n = window)
        }
        e.exports = n
    },
    6: function(e, t) {}
});
