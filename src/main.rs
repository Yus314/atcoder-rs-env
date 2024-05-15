use ac_library::modint::ModInt998244353 as Mint;
use proconio::input;

fn main() {
    input! {
        n:u64,
        mut a:[u64;n],
    }
    let mut ans = Mint::raw(0);
    let mut sum = Mint::raw(0);
    for (i, a) in a.into_iter().enumerate() {
        ans += sum * Mint::raw(10).pow(a.to_string().len() as u64) + a * i as u64;
        sum += a;
    }
    println!("{}", ans);
}
