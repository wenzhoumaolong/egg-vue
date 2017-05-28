import fetch from 'utils/fetch';

export function login(phone, password) {
  const data = { phone, password };
  return fetch({
    url: 'login',
    method: 'post',
    data
  });
}

export function logout() {
  return fetch({
    url: '/login/logout',
    method: 'post'
  });
}

export function getInfo(token) {
  return fetch({
    url: '/user/info',
    method: 'get',
    params: { token }
  });
}

