import SwiftUI

/// Provider marks traced from `docs/design/frame-124-hover-tooltip.png`.
///
/// The three marks in the frame are logos, so they are not re-drawn by hand
/// here — each outline was traced off the design frame (marching squares over
/// the 46px glyph, smoothed, simplified) and normalised into a unit box. Filled
/// even-odd, so the inner counters of the OpenAI knot stay open.
///
/// They are traced from a 46px source, so they are as crisp as the frame is and
/// no crisper. Dropping a real vector export (PDF/SVG from Figma) into an asset
/// catalogue under the glyph's `assetName` makes `ProviderGlyphView` prefer it.
///
/// `cursor` is the exception and the better way: it is flattened from Cursor's
/// own SVG rather than traced from a screenshot, so it is exact at any size.
enum GlyphOutline {
    static let claude: [[CGPoint]] = [
        [CGPoint(x: 0.2879, y: 0.0108), CGPoint(x: 0.2667, y: 0.0223), CGPoint(x: 0.2423, y: 0.0516), 
         CGPoint(x: 0.2427, y: 0.0873), CGPoint(x: 0.2611, y: 0.1275), CGPoint(x: 0.3425, y: 0.2606), 
         CGPoint(x: 0.3879, y: 0.3474), CGPoint(x: 0.3888, y: 0.3670), CGPoint(x: 0.3695, y: 0.3643), 
         CGPoint(x: 0.2014, y: 0.2351), CGPoint(x: 0.1878, y: 0.2200), CGPoint(x: 0.1552, y: 0.1998), 
         CGPoint(x: 0.1253, y: 0.1950), CGPoint(x: 0.1111, y: 0.1995), CGPoint(x: 0.0877, y: 0.2258), 
         CGPoint(x: 0.0887, y: 0.2565), CGPoint(x: 0.0953, y: 0.2714), CGPoint(x: 0.1180, y: 0.2961), 
         CGPoint(x: 0.1661, y: 0.3284), CGPoint(x: 0.1791, y: 0.3426), CGPoint(x: 0.2965, y: 0.4155), 
         CGPoint(x: 0.3095, y: 0.4297), CGPoint(x: 0.3940, y: 0.4803), CGPoint(x: 0.3974, y: 0.4946), 
         CGPoint(x: 0.3767, y: 0.5004), CGPoint(x: 0.2177, y: 0.4830), CGPoint(x: 0.0404, y: 0.4741), 
         CGPoint(x: 0.0186, y: 0.4808), CGPoint(x: 0.0129, y: 0.4990), CGPoint(x: 0.0276, y: 0.5245), 
         CGPoint(x: 0.0649, y: 0.5375), CGPoint(x: 0.3801, y: 0.5449), CGPoint(x: 0.3943, y: 0.5488), 
         CGPoint(x: 0.3979, y: 0.5574), CGPoint(x: 0.3773, y: 0.5800), CGPoint(x: 0.3130, y: 0.6116), 
         CGPoint(x: 0.2589, y: 0.6470), CGPoint(x: 0.2341, y: 0.6564), CGPoint(x: 0.1360, y: 0.7209), 
         CGPoint(x: 0.1142, y: 0.7485), CGPoint(x: 0.1149, y: 0.7681), CGPoint(x: 0.1416, y: 0.7866), 
         CGPoint(x: 0.1912, y: 0.7787), CGPoint(x: 0.4120, y: 0.6320), CGPoint(x: 0.4270, y: 0.6288), 
         CGPoint(x: 0.4321, y: 0.6332), CGPoint(x: 0.4292, y: 0.6454), CGPoint(x: 0.3940, y: 0.6799), 
         CGPoint(x: 0.3428, y: 0.7530), CGPoint(x: 0.2416, y: 0.8771), CGPoint(x: 0.2334, y: 0.9073), 
         CGPoint(x: 0.2403, y: 0.9269), CGPoint(x: 0.2558, y: 0.9336), CGPoint(x: 0.2734, y: 0.9308), 
         CGPoint(x: 0.3431, y: 0.8618), CGPoint(x: 0.4700, y: 0.6899), CGPoint(x: 0.4807, y: 0.6667), 
         CGPoint(x: 0.4915, y: 0.6611), CGPoint(x: 0.5001, y: 0.6669), CGPoint(x: 0.4995, y: 0.6906), 
         CGPoint(x: 0.4474, y: 0.9569), CGPoint(x: 0.4618, y: 0.9946), CGPoint(x: 0.4901, y: 1.0070), 
         CGPoint(x: 0.5162, y: 0.9945), CGPoint(x: 0.5228, y: 0.9833), CGPoint(x: 0.5369, y: 0.9018), 
         CGPoint(x: 0.5520, y: 0.7109), CGPoint(x: 0.5593, y: 0.6981), CGPoint(x: 0.5814, y: 0.7096), 
         CGPoint(x: 0.6328, y: 0.7971), CGPoint(x: 0.7227, y: 0.9242), CGPoint(x: 0.7395, y: 0.9333), 
         CGPoint(x: 0.7662, y: 0.9315), CGPoint(x: 0.7775, y: 0.9241), CGPoint(x: 0.7830, y: 0.9106), 
         CGPoint(x: 0.7785, y: 0.8597), CGPoint(x: 0.6882, y: 0.7238), CGPoint(x: 0.6753, y: 0.7115), 
         CGPoint(x: 0.6765, y: 0.6956), CGPoint(x: 0.6875, y: 0.6957), CGPoint(x: 0.7252, y: 0.7339), 
         CGPoint(x: 0.8721, y: 0.8489), CGPoint(x: 0.8842, y: 0.8515), CGPoint(x: 0.8959, y: 0.8468), 
         CGPoint(x: 0.9038, y: 0.8373), CGPoint(x: 0.9046, y: 0.8256), CGPoint(x: 0.8530, y: 0.7662), 
         CGPoint(x: 0.6984, y: 0.6269), CGPoint(x: 0.6775, y: 0.6016), CGPoint(x: 0.6778, y: 0.5933), 
         CGPoint(x: 0.6885, y: 0.5908), CGPoint(x: 0.8106, y: 0.6247), CGPoint(x: 0.9440, y: 0.6533), 
         CGPoint(x: 0.9782, y: 0.6467), CGPoint(x: 1.0094, y: 0.6185), CGPoint(x: 0.9968, y: 0.5927), 
         CGPoint(x: 0.9637, y: 0.5647), CGPoint(x: 0.8743, y: 0.5599), CGPoint(x: 0.8332, y: 0.5528), 
         CGPoint(x: 0.7469, y: 0.5529), CGPoint(x: 0.7252, y: 0.5475), CGPoint(x: 0.7138, y: 0.5382), 
         CGPoint(x: 0.7174, y: 0.5299), CGPoint(x: 0.7308, y: 0.5244), CGPoint(x: 0.9772, y: 0.4740), 
         CGPoint(x: 0.9904, y: 0.4655), CGPoint(x: 0.9985, y: 0.4514), CGPoint(x: 1.0037, y: 0.4324), 
         CGPoint(x: 1.0001, y: 0.4183), CGPoint(x: 0.9889, y: 0.4107), CGPoint(x: 0.9616, y: 0.4064), 
         CGPoint(x: 0.8604, y: 0.4200), CGPoint(x: 0.7578, y: 0.4394), CGPoint(x: 0.7164, y: 0.4523), 
         CGPoint(x: 0.7010, y: 0.4468), CGPoint(x: 0.7391, y: 0.3769), CGPoint(x: 0.8619, y: 0.2207), 
         CGPoint(x: 0.8733, y: 0.1749), CGPoint(x: 0.8678, y: 0.1520), CGPoint(x: 0.8528, y: 0.1331), 
         CGPoint(x: 0.8338, y: 0.1217), CGPoint(x: 0.8169, y: 0.1215), CGPoint(x: 0.7888, y: 0.1313), 
         CGPoint(x: 0.7199, y: 0.2007), CGPoint(x: 0.6224, y: 0.3290), CGPoint(x: 0.6034, y: 0.3517), 
         CGPoint(x: 0.5941, y: 0.3541), CGPoint(x: 0.5878, y: 0.3448), CGPoint(x: 0.5875, y: 0.3285), 
         CGPoint(x: 0.6249, y: 0.1713), CGPoint(x: 0.6378, y: 0.0744), CGPoint(x: 0.6253, y: 0.0430), 
         CGPoint(x: 0.6043, y: 0.0257), CGPoint(x: 0.5890, y: 0.0265), CGPoint(x: 0.5661, y: 0.0463), 
         CGPoint(x: 0.5471, y: 0.0805), CGPoint(x: 0.5369, y: 0.2279), CGPoint(x: 0.5259, y: 0.2877), 
         CGPoint(x: 0.5223, y: 0.3461), CGPoint(x: 0.5165, y: 0.3730), CGPoint(x: 0.5080, y: 0.3786), 
         CGPoint(x: 0.4728, y: 0.2909), CGPoint(x: 0.3941, y: 0.1409), CGPoint(x: 0.3647, y: 0.0645), 
         CGPoint(x: 0.3439, y: 0.0282), CGPoint(x: 0.3305, y: 0.0183), CGPoint(x: 0.3013, y: 0.0095), 
         CGPoint(x: 0.2880, y: 0.0108)],
    ]

    static let openai: [[CGPoint]] = [
        [CGPoint(x: 0.4234, y: -0.0272), CGPoint(x: 0.3541, y: -0.0187), CGPoint(x: 0.3013, y: 0.0040), 
         CGPoint(x: 0.2422, y: 0.0495), CGPoint(x: 0.2012, y: 0.1069), CGPoint(x: 0.1823, y: 0.1455), 
         CGPoint(x: 0.1435, y: 0.1661), CGPoint(x: 0.1104, y: 0.1756), CGPoint(x: 0.0468, y: 0.2232), 
         CGPoint(x: 0.0013, y: 0.2863), CGPoint(x: -0.0216, y: 0.3430), CGPoint(x: -0.0275, y: 0.4147), 
         CGPoint(x: -0.0212, y: 0.4800), CGPoint(x: 0.0021, y: 0.5354), CGPoint(x: 0.0380, y: 0.5897), 
         CGPoint(x: 0.0271, y: 0.6302), CGPoint(x: 0.0242, y: 0.6634), CGPoint(x: 0.0281, y: 0.7123), 
         CGPoint(x: 0.0453, y: 0.7686), CGPoint(x: 0.0889, y: 0.8376), CGPoint(x: 0.1131, y: 0.8638), 
         CGPoint(x: 0.1823, y: 0.9074), CGPoint(x: 0.2413, y: 0.9266), CGPoint(x: 0.3060, y: 0.9300), 
         CGPoint(x: 0.3346, y: 0.9264), CGPoint(x: 0.3516, y: 0.9307), CGPoint(x: 0.4021, y: 0.9710), 
         CGPoint(x: 0.4298, y: 0.9808), CGPoint(x: 0.4562, y: 0.9973), CGPoint(x: 0.5234, y: 1.0093), 
         CGPoint(x: 0.5785, y: 1.0094), CGPoint(x: 0.6468, y: 0.9924), CGPoint(x: 0.7148, y: 0.9513), 
         CGPoint(x: 0.7772, y: 0.8832), CGPoint(x: 0.8042, y: 0.8303), CGPoint(x: 0.8365, y: 0.8205), 
         CGPoint(x: 0.8821, y: 0.7975), CGPoint(x: 0.9458, y: 0.7449), CGPoint(x: 0.9740, y: 0.7075), 
         CGPoint(x: 0.9957, y: 0.6627), CGPoint(x: 1.0095, y: 0.5968), CGPoint(x: 1.0090, y: 0.5479), 
         CGPoint(x: 0.9945, y: 0.4764), CGPoint(x: 0.9451, y: 0.3970), CGPoint(x: 0.9551, y: 0.3353), 
         CGPoint(x: 0.9516, y: 0.2607), CGPoint(x: 0.9295, y: 0.1997), CGPoint(x: 0.8836, y: 0.1329), 
         CGPoint(x: 0.8279, y: 0.0900), CGPoint(x: 0.7854, y: 0.0679), CGPoint(x: 0.7109, y: 0.0532), 
         CGPoint(x: 0.6410, y: 0.0590), CGPoint(x: 0.6009, y: 0.0243), CGPoint(x: 0.5658, y: 0.0021), 
         CGPoint(x: 0.5325, y: -0.0075), CGPoint(x: 0.5138, y: -0.0192), CGPoint(x: 0.4237, y: -0.0273)],
        [CGPoint(x: 0.5915, y: 0.6193), CGPoint(x: 0.6003, y: 0.6198), CGPoint(x: 0.6051, y: 0.6294), 
         CGPoint(x: 0.6065, y: 0.6987), CGPoint(x: 0.6030, y: 0.7094), CGPoint(x: 0.5791, y: 0.7311), 
         CGPoint(x: 0.5493, y: 0.7434), CGPoint(x: 0.4991, y: 0.7768), CGPoint(x: 0.4755, y: 0.7856), 
         CGPoint(x: 0.3803, y: 0.8423), CGPoint(x: 0.3101, y: 0.8617), CGPoint(x: 0.2639, y: 0.8607), 
         CGPoint(x: 0.2101, y: 0.8447), CGPoint(x: 0.1602, y: 0.8126), CGPoint(x: 0.1332, y: 0.7824), 
         CGPoint(x: 0.1099, y: 0.7456), CGPoint(x: 0.0966, y: 0.6858), CGPoint(x: 0.0971, y: 0.6532), 
         CGPoint(x: 0.1028, y: 0.6439), CGPoint(x: 0.1253, y: 0.6483), CGPoint(x: 0.1529, y: 0.6679), 
         CGPoint(x: 0.1798, y: 0.6772), CGPoint(x: 0.2300, y: 0.7111), CGPoint(x: 0.2579, y: 0.7211), 
         CGPoint(x: 0.3071, y: 0.7554), CGPoint(x: 0.3359, y: 0.7601), CGPoint(x: 0.3530, y: 0.7554), 
         CGPoint(x: 0.5913, y: 0.6194)],
        [CGPoint(x: 0.1549, y: 0.2337), CGPoint(x: 0.1661, y: 0.2362), CGPoint(x: 0.1713, y: 0.2520), 
         CGPoint(x: 0.1740, y: 0.4890), CGPoint(x: 0.2443, y: 0.5383), CGPoint(x: 0.3815, y: 0.6098), 
         CGPoint(x: 0.3978, y: 0.6261), CGPoint(x: 0.4244, y: 0.6356), CGPoint(x: 0.4284, y: 0.6478), 
         CGPoint(x: 0.4203, y: 0.6616), CGPoint(x: 0.3691, y: 0.6910), CGPoint(x: 0.3509, y: 0.6950), 
         CGPoint(x: 0.3314, y: 0.6910), CGPoint(x: 0.3149, y: 0.6770), CGPoint(x: 0.2011, y: 0.6118), 
         CGPoint(x: 0.1787, y: 0.6039), CGPoint(x: 0.1148, y: 0.5618), CGPoint(x: 0.0696, y: 0.5126), 
         CGPoint(x: 0.0463, y: 0.4673), CGPoint(x: 0.0413, y: 0.4222), CGPoint(x: 0.0428, y: 0.3713), 
         CGPoint(x: 0.0661, y: 0.3121), CGPoint(x: 0.1072, y: 0.2634), CGPoint(x: 0.1340, y: 0.2422), 
         CGPoint(x: 0.1549, y: 0.2337)],
        [CGPoint(x: 0.6595, y: 0.4590), CGPoint(x: 0.6735, y: 0.4607), CGPoint(x: 0.7335, y: 0.5002), 
         CGPoint(x: 0.7409, y: 0.5112), CGPoint(x: 0.7407, y: 0.7673), CGPoint(x: 0.7335, y: 0.8119), 
         CGPoint(x: 0.6907, y: 0.8831), CGPoint(x: 0.6628, y: 0.9073), CGPoint(x: 0.6193, y: 0.9293), 
         CGPoint(x: 0.5683, y: 0.9410), CGPoint(x: 0.4861, y: 0.9339), CGPoint(x: 0.4346, y: 0.9106), 
         CGPoint(x: 0.4283, y: 0.8998), CGPoint(x: 0.4330, y: 0.8914), CGPoint(x: 0.4606, y: 0.8724), 
         CGPoint(x: 0.5577, y: 0.8212), CGPoint(x: 0.5741, y: 0.8071), CGPoint(x: 0.5975, y: 0.7986), 
         CGPoint(x: 0.6123, y: 0.7854), CGPoint(x: 0.6347, y: 0.7751), CGPoint(x: 0.6475, y: 0.7604), 
         CGPoint(x: 0.6525, y: 0.7361), CGPoint(x: 0.6513, y: 0.4738), CGPoint(x: 0.6592, y: 0.4591)],
        [CGPoint(x: 0.4201, y: 0.0407), CGPoint(x: 0.4901, y: 0.0454), CGPoint(x: 0.5415, y: 0.0677), 
         CGPoint(x: 0.5485, y: 0.0825), CGPoint(x: 0.5360, y: 0.1008), CGPoint(x: 0.5091, y: 0.1112), 
         CGPoint(x: 0.4589, y: 0.1456), CGPoint(x: 0.3563, y: 0.1987), CGPoint(x: 0.3290, y: 0.2258), 
         CGPoint(x: 0.3275, y: 0.5024), CGPoint(x: 0.3233, y: 0.5161), CGPoint(x: 0.3135, y: 0.5208), 
         CGPoint(x: 0.3039, y: 0.5183), CGPoint(x: 0.2881, y: 0.5027), CGPoint(x: 0.2618, y: 0.4935), 
         CGPoint(x: 0.2379, y: 0.4671), CGPoint(x: 0.2377, y: 0.2259), CGPoint(x: 0.2419, y: 0.1878), 
         CGPoint(x: 0.2623, y: 0.1376), CGPoint(x: 0.3041, y: 0.0883), CGPoint(x: 0.3313, y: 0.0668), 
         CGPoint(x: 0.3713, y: 0.0482), CGPoint(x: 0.4197, y: 0.0407)],
        [CGPoint(x: 0.6793, y: 0.1223), CGPoint(x: 0.7157, y: 0.1231), CGPoint(x: 0.7641, y: 0.1328), 
         CGPoint(x: 0.8047, y: 0.1561), CGPoint(x: 0.8276, y: 0.1768), CGPoint(x: 0.8625, y: 0.2233), 
         CGPoint(x: 0.8807, y: 0.2686), CGPoint(x: 0.8876, y: 0.3190), CGPoint(x: 0.8831, y: 0.3376), 
         CGPoint(x: 0.8696, y: 0.3399), CGPoint(x: 0.8290, y: 0.3206), CGPoint(x: 0.7808, y: 0.2871), 
         CGPoint(x: 0.7555, y: 0.2771), CGPoint(x: 0.7028, y: 0.2432), CGPoint(x: 0.6491, y: 0.2198), 
         CGPoint(x: 0.6010, y: 0.2420), CGPoint(x: 0.3950, y: 0.3609), CGPoint(x: 0.3770, y: 0.3587), 
         CGPoint(x: 0.3753, y: 0.2836), CGPoint(x: 0.3855, y: 0.2637), CGPoint(x: 0.6109, y: 0.1354), 
         CGPoint(x: 0.6793, y: 0.1223)],
        [CGPoint(x: 0.6168, y: 0.2853), CGPoint(x: 0.6369, y: 0.2862), CGPoint(x: 0.8593, y: 0.4128), 
         CGPoint(x: 0.9080, y: 0.4616), CGPoint(x: 0.9290, y: 0.4972), CGPoint(x: 0.9405, y: 0.5690), 
         CGPoint(x: 0.9306, y: 0.6410), CGPoint(x: 0.9050, y: 0.6876), CGPoint(x: 0.8550, y: 0.7354), 
         CGPoint(x: 0.8203, y: 0.7467), CGPoint(x: 0.8106, y: 0.7381), CGPoint(x: 0.8105, y: 0.5166), 
         CGPoint(x: 0.8003, y: 0.4834), CGPoint(x: 0.7040, y: 0.4293), CGPoint(x: 0.6883, y: 0.4155), 
         CGPoint(x: 0.6661, y: 0.4077), CGPoint(x: 0.5469, y: 0.3401), CGPoint(x: 0.5506, y: 0.3260), 
         CGPoint(x: 0.6001, y: 0.2999), CGPoint(x: 0.6168, y: 0.2853)],
        [CGPoint(x: 0.4779, y: 0.3668), CGPoint(x: 0.5139, y: 0.3713), CGPoint(x: 0.5650, y: 0.4061), 
         CGPoint(x: 0.5917, y: 0.4164), CGPoint(x: 0.6023, y: 0.4290), CGPoint(x: 0.6061, y: 0.4482), 
         CGPoint(x: 0.6032, y: 0.5543), CGPoint(x: 0.5631, y: 0.5821), CGPoint(x: 0.4922, y: 0.6155), 
         CGPoint(x: 0.4806, y: 0.6145), CGPoint(x: 0.4134, y: 0.5801), CGPoint(x: 0.3827, y: 0.5553), 
         CGPoint(x: 0.3749, y: 0.5304), CGPoint(x: 0.3747, y: 0.4480), CGPoint(x: 0.3821, y: 0.4243), 
         CGPoint(x: 0.4778, y: 0.3668)],
    ]

    /// Grok: traced from x.ai's own Feb-2025 mark SVG (the id="mark" paths,
    /// separate from the wordmark), sourced via Wikimedia Commons
    /// (Grok-feb-2025-logo.svg, credited to X.AI Corp.) — the interlocking
    /// spiral, not a placeholder star.
    static let grok: [[CGPoint]] = [
        [CGPoint(x: 0.3862, y: 0.6419), CGPoint(x: 0.7237, y: 0.3827), CGPoint(x: 0.7346, y: 0.3793), CGPoint(x: 0.7455, y: 0.3799),
         CGPoint(x: 0.7554, y: 0.3843), CGPoint(x: 0.7632, y: 0.3924), CGPoint(x: 0.7765, y: 0.4292), CGPoint(x: 0.7867, y: 0.4943),
         CGPoint(x: 0.7825, y: 0.5601), CGPoint(x: 0.7636, y: 0.6237), CGPoint(x: 0.7298, y: 0.6824), CGPoint(x: 0.6820, y: 0.7324),
         CGPoint(x: 0.6267, y: 0.7675), CGPoint(x: 0.5667, y: 0.7871), CGPoint(x: 0.5040, y: 0.7915), CGPoint(x: 0.4407, y: 0.7808),
         CGPoint(x: 0.2964, y: 0.8245), CGPoint(x: 0.3970, y: 0.8769), CGPoint(x: 0.5006, y: 0.8968), CGPoint(x: 0.6022, y: 0.8864),
         CGPoint(x: 0.6965, y: 0.8478), CGPoint(x: 0.7782, y: 0.7831), CGPoint(x: 0.8287, y: 0.7181), CGPoint(x: 0.8635, y: 0.6466),
         CGPoint(x: 0.8830, y: 0.5711), CGPoint(x: 0.8876, y: 0.4940), CGPoint(x: 0.8777, y: 0.4177), CGPoint(x: 0.8684, y: 0.3660),
         CGPoint(x: 0.8649, y: 0.2774), CGPoint(x: 0.8807, y: 0.2018), CGPoint(x: 0.9140, y: 0.1302), CGPoint(x: 0.9629, y: 0.0537),
         CGPoint(x: 0.9933, y: 0.0097), CGPoint(x: 0.9948, y: 0.0076), CGPoint(x: 0.9963, y: 0.0054), CGPoint(x: 0.9978, y: 0.0033),
         CGPoint(x: 0.9993, y: 0.0011), CGPoint(x: 0.8624, y: 0.1435)],
        [CGPoint(x: 0.3176, y: 0.7041), CGPoint(x: 0.2637, y: 0.6281), CGPoint(x: 0.2398, y: 0.5435), CGPoint(x: 0.2432, y: 0.4571),
         CGPoint(x: 0.2710, y: 0.3755), CGPoint(x: 0.3206, y: 0.3055), CGPoint(x: 0.3697, y: 0.2653), CGPoint(x: 0.4272, y: 0.2375),
         CGPoint(x: 0.4899, y: 0.2236), CGPoint(x: 0.5549, y: 0.2251), CGPoint(x: 0.6192, y: 0.2437), CGPoint(x: 0.7256, y: 0.1848),
         CGPoint(x: 0.7121, y: 0.1754), CGPoint(x: 0.6974, y: 0.1663), CGPoint(x: 0.6815, y: 0.1576), CGPoint(x: 0.6645, y: 0.1496),
         CGPoint(x: 0.6145, y: 0.1313), CGPoint(x: 0.5291, y: 0.1173), CGPoint(x: 0.4430, y: 0.1241), CGPoint(x: 0.3600, y: 0.1515),
         CGPoint(x: 0.2837, y: 0.1995), CGPoint(x: 0.2199, y: 0.2660), CGPoint(x: 0.1744, y: 0.3441), CGPoint(x: 0.1475, y: 0.4303),
         CGPoint(x: 0.1402, y: 0.5206), CGPoint(x: 0.1532, y: 0.6111), CGPoint(x: 0.1771, y: 0.6865), CGPoint(x: 0.1786, y: 0.7446),
         CGPoint(x: 0.1612, y: 0.7973), CGPoint(x: 0.1302, y: 0.8464), CGPoint(x: 0.0910, y: 0.8933), CGPoint(x: 0.0626, y: 0.9246),
         CGPoint(x: 0.0477, y: 0.9411), CGPoint(x: 0.0332, y: 0.9576), CGPoint(x: 0.0193, y: 0.9744), CGPoint(x: 0.0062, y: 0.9914)],
    ]

    /// Svelka: traced from the app's own icon.png (Tauri desktop app bundle,
    /// apps/desktop/src-tauri/icons/icon.png) via contour extraction on the
    /// teal mark color -- the blocky "S" glyph plus its trailing dot, not a
    /// placeholder diamond.
    static let svelka: [[CGPoint]] = [
        [CGPoint(x: 0.6963, y: 0.7617), CGPoint(x: 0.0963, y: 0.7617), CGPoint(x: 0.0950, y: 0.6798), CGPoint(x: 0.0000, y: 0.6777),
         CGPoint(x: 0.0000, y: 0.3798), CGPoint(x: 0.0938, y: 0.3787), CGPoint(x: 0.0963, y: 0.2979), CGPoint(x: 0.6000, y: 0.2968),
         CGPoint(x: 0.5988, y: 0.1660), CGPoint(x: 0.0963, y: 0.1660), CGPoint(x: 0.0963, y: 0.0000), CGPoint(x: 0.6963, y: 0.0000),
         CGPoint(x: 0.6987, y: 0.0809), CGPoint(x: 0.7950, y: 0.0819), CGPoint(x: 0.7950, y: 0.3798), CGPoint(x: 0.6987, y: 0.3809),
         CGPoint(x: 0.6963, y: 0.4638), CGPoint(x: 0.1950, y: 0.4649), CGPoint(x: 0.1963, y: 0.5957), CGPoint(x: 0.6963, y: 0.5957),
         CGPoint(x: 0.6963, y: 0.7617)],
        [CGPoint(x: 0.9263, y: 1.0000), CGPoint(x: 0.8912, y: 0.9979), CGPoint(x: 0.8612, y: 0.9851), CGPoint(x: 0.8350, y: 0.9585),
         CGPoint(x: 0.8275, y: 0.9372), CGPoint(x: 0.8300, y: 0.9074), CGPoint(x: 0.8450, y: 0.8819), CGPoint(x: 0.8762, y: 0.8596),
         CGPoint(x: 0.9012, y: 0.8532), CGPoint(x: 0.9363, y: 0.8553), CGPoint(x: 0.9663, y: 0.8681), CGPoint(x: 0.9925, y: 0.8947),
         CGPoint(x: 1.0000, y: 0.9160), CGPoint(x: 0.9975, y: 0.9457), CGPoint(x: 0.9825, y: 0.9713), CGPoint(x: 0.9513, y: 0.9936),
         CGPoint(x: 0.9263, y: 1.0000)],
    ]

    /// OpenCode: the project's own mark from simple-icons (a thick-bordered
    /// square, MIT-licensed), not a placeholder hexagon.
    static let opencode: [[CGPoint]] = [
        [CGPoint(x: 0.9167, y: 1.0000), CGPoint(x: 0.0833, y: 1.0000), CGPoint(x: 0.0833, y: 0.0000), CGPoint(x: 0.9167, y: 0.0000)],
        [CGPoint(x: 0.7083, y: 0.2000), CGPoint(x: 0.2917, y: 0.2000), CGPoint(x: 0.2917, y: 0.8000), CGPoint(x: 0.7083, y: 0.8000)],
    ]

    /// Freebuff: traced from freebuff.com's own apple-touch-icon (a sparkle
    /// plus a trailing dash), not a placeholder octagon.
    static let freebuff: [[CGPoint]] = [
        [CGPoint(x: 0.2819, y: 0.8387), CGPoint(x: 0.2340, y: 0.6371), CGPoint(x: 0.1755, y: 0.5323), CGPoint(x: 0.1117, y: 0.4677),
         CGPoint(x: 0.0000, y: 0.4274), CGPoint(x: 0.1330, y: 0.3548), CGPoint(x: 0.2021, y: 0.2661), CGPoint(x: 0.2447, y: 0.1694),
         CGPoint(x: 0.2713, y: 0.0000), CGPoint(x: 0.3191, y: 0.2016), CGPoint(x: 0.3777, y: 0.3065), CGPoint(x: 0.4415, y: 0.3710),
         CGPoint(x: 0.5532, y: 0.4113), CGPoint(x: 0.4202, y: 0.4839), CGPoint(x: 0.3511, y: 0.5726), CGPoint(x: 0.3085, y: 0.6694),
         CGPoint(x: 0.2819, y: 0.8387)],
        [CGPoint(x: 0.9947, y: 1.0000), CGPoint(x: 0.5798, y: 1.0000), CGPoint(x: 0.5745, y: 0.8790), CGPoint(x: 0.9947, y: 0.8710)],
    ]

}
